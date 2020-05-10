DEFAULT_ACCESS_EXPIRATION = 3_600 # 1 hour in seconds
DEFAULT_REFRESH_EXPIRATION = 86_400 # 24 hours in seconds

JWTSessions.algorithm = 'HS256'
JWTSessions.encryption_key = 'sdfghjkpokjbfghj456789vbnm,ghj'
JWTSessions.access_exp_time = DEFAULT_ACCESS_EXPIRATION
JWTSessions.refresh_exp_time = DEFAULT_REFRESH_EXPIRATION
