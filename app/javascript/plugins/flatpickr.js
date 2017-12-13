import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr(".datepicker", {
  disableMobile: "true"
})


flatpickr("#transport_departure_date", {
  disableMobile: "true",
  plugins: [new rangePlugin({ input: "#transport_arrival_date"})]
})

flatpickr("#accommodation_arrival_date", {
  disableMobile: "true",
  plugins: [new rangePlugin({ input: "#accommodation_departure_date"})]
}
)

