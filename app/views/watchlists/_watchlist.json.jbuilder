json.extract! watchlist, :id, :name, :tickers, :user_id, :created_at, :updated_at
json.url watchlist_url(watchlist, format: :json)
