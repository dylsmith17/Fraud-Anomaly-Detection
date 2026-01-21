-- Raw, append-only transactions table
CREATE TABLE IF NOT EXISTS transactions_raw (
    transaction_id INTEGER PRIMARY KEY,
    time_seconds INTEGER NOT NULL,
    amount REAL NOT NULL,
    class INTEGER              -- 1 = fraud, 0 = legitimate (may be NULL for live data)
);

-- Scored transactions (outputs of the pipeline)
CREATE TABLE IF NOT EXISTS transactions_scored (
    transaction_id INTEGER PRIMARY KEY,
    fraud_probability REAL NOT NULL,
    anomaly_score REAL NOT NULL,
    risk_score REAL NOT NULL,
    scored_at TEXT NOT NULL
);

-- Drift monitoring metrics (feature-level)
CREATE TABLE IF NOT EXISTS drift_metrics (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    feature_name TEXT NOT NULL,
    metric_type TEXT NOT NULL,      -- e.g. 'PSI', 'KS'
    metric_value REAL NOT NULL,
    window_start TEXT NOT NULL,
    window_end TEXT NOT NULL,
    detected_at TEXT NOT NULL
);
