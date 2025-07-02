const whitelist = ["http://10.0.2.2:4000", "http://localhost:5173"];
const corsOptions = {
  origin: whitelist,
  credentials: true,
  withCredentials: true,
  optionsSuccessStatus: 200,
  methods: ["GET", "POST", "PATCH", "PUT", "DELETE"],
  allowedHeaders: [
    "Content-Type",
    "Origin",
    "X-Requested-With",
    "Accept",
    "x-client-key",
    "x-client-token",
    "x-client-secret",
    "Authorization",
  ],
};

module.exports = corsOptions;
