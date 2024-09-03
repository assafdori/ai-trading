import yfinance as yf
from sklearn.linear_model import LinearRegression
import numpy as np

# Fetch Apple's historical stock data
ticker = 'AAPL'
data = yf.download(ticker, start='2023-01-01', end='2024-01-01')

# Get the closing prices
closing_prices = data['Close'].values.reshape(-1, 1)

# Prepare the data for linear regression
X = np.array(range(len(closing_prices))).reshape(-1, 1)
y = closing_prices

# Train the model
model = LinearRegression()
model.fit(X, y)

# Predict tomorrow's value
tomorrow_index = np.array([[len(closing_prices)]])
tomorrow_price = model.predict(tomorrow_index)

print(f"Estimated Apple's stock price for tomorrow: ${tomorrow_price[0][0]:.2f}")
