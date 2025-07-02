const express = require("express");
const app = express();
const dotenv = require("dotenv");
const cors = require("cors");
const corsOptions = require("./config/corsOptions");
const connectDB = require("./ConnectDB");

dotenv.config({ path: ".env" });
connectDB();

app.get("/ping", (_, res) => res.send("pong"));

app.use(cors(corsOptions));
app.use(express.json());
app.use("/public", express.static("public"));

app.use("/signup", require("./api/users/signup"));

const PORT = process.env.PORT || 5500;

app.listen(PORT, `0.0.0.0`, () => {
  console.log(`listening on port ${PORT}`);
});
