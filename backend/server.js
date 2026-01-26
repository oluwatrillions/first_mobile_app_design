const express = require("express");
const app = express();
const dotenv = require("dotenv");
const cors = require("cors");
const corsOptions = require("./config/corsOptions");
const connectDB = require("./ConnectDB");

dotenv.config({ path: ".env" });
connectDB();

app.use(cors(corsOptions));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/public", express.static("public"));

app.use("/signup", require("./api/users/signup"));
app.use("/login", require("./api/users/login"));

const PORT = 5500;

app.listen(process.env.PORT, "0.0.0.0", () => {
  console.log(`listening on port ${process.env.PORT}`);
});
