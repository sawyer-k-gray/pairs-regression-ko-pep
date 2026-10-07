'''
Project: Coke vs. Pepsi Pair Regression Analysis
Pulls five years of historical adjusted stock prices
from Yahoo Finance, converts into log returns, and 
exports the data into a CSV file.
'''

import yfinance as yf
import numpy as np
import pandas as pd



def fetch_data():
    
    tickers = ['KO', 'PEP']

    raw_download = yf.download(tickers, start='2021-01-01', end='2026-01-01', auto_adjust=True)
    
    data = raw_download['Close'].dropna()
    
    log_returns = np.log(data / data.shift(1)).dropna()
    
    log_returns.to_csv("data/coke_pepsi_returns.csv")


if __name__ == '__main__':
    fetch_data()
