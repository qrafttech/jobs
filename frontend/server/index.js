const express = require("express");
const cars = require("./cars.json");
const app = express();

const PORT = 3000;
const URL = `http://localhost:${PORT}`;

app.get("/cars", (req, res) => {
  let availableCars = cars.map((car, i) => {
    const id = i + 1;
    return { id, pictureUrl: `${URL}/pictures/${id}.jpg`, ...car };
  });

  if (req.query.duration) {
    availableCars = availableCars.filter(
      ({ availability }) =>
        parseInt(req.query.duration, 10) <= availability.maxDuration
    );
  }

  if (req.query.distance) {
    availableCars = availableCars.filter(
      ({ availability }) =>
        parseInt(req.query.distance, 10) <= availability.maxDistance
    );
  }

  res.setHeader("Access-Control-Allow-Origin", "*");
  res.json(availableCars);
});

app.use(express.static("server/public"));
app.listen(PORT);
