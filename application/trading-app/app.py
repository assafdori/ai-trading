from flask import Flask, render_template, request
import yfinance as yf
import numpy as np
from sklearn.linear_model import LinearRegression

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def index():
    predicted_value = None
    stock_ticker = None

    if request.method == 'POST':
        stock_ticker = request.form['stock']
        predicted_value = get_stock_data(stock_ticker)

    # Updated stock list with INTC as the first stock
    stock_list = ['INTC', 'AAPL', 'GOOGL', 'AMZN', 'MSFT', 'TSLA', 'FB', 'NFLX', 'NVDA', 'BABA']
    stock_predictions = {ticker: get_stock_data(ticker) for ticker in stock_list}

    return render_template('index.html', predicted_value=predicted_value, stock_ticker=stock_ticker,
                           stock_predictions=stock_predictions)


def get_stock_data(ticker):
    # Fetch 5 days of stock data to get the last 2 days
    try:
        stock_data = yf.download(ticker, period='5d', interval='1d')
        if len(stock_data) < 2:
            return {
                "yesterday": "N/A",
                "today": "N/A",
                "predicted_tomorrow": {
                    "value": "N/A",
                    "sign": "",
                    "color": "black"
                }
            }

        # Get the last two closing prices (yesterday and today)
        prices = stock_data['Close'].values[-2:]

        # Use Linear Regression to predict the next price
        X = np.array([1, 2]).reshape(-1, 1)  # Days for regression (yesterday=1, today=2)
        y = prices
        model = LinearRegression()
        model.fit(X, y)
        next_day = np.array([[3]])  # Predict for tomorrow
        predicted_price = model.predict(next_day)[0]

        # Determine whether the predicted price is higher or lower than today's price
        sign = "+" if predicted_price > prices[1] else "-"
        color = "green" if predicted_price > prices[1] else "red"

        return {
            "yesterday": round(prices[0], 2),
            "today": round(prices[1], 2),
            "predicted_tomorrow": {
                "value": round(predicted_price, 2),
                "sign": sign,
                "color": color
            }
        }
    except Exception:
        # Handle errors (e.g., missing stock data)
        return {
            "yesterday": "N/A",
            "today": "N/A",
            "predicted_tomorrow": {
                "value": "N/A",
                "sign": "",
                "color": "black"
            }
        }


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5050, debug=True)
