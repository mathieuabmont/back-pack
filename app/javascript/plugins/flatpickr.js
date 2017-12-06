import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
import confirmDatePlugin from "flatpickr/dist/plugins/confirmDatePlugin"

flatpickr(".datepicker", {
  altinput: true,
})

flatpickr("#transport_departure_date", {
  altinput: true,
  plugins: [new rangePlugin({ input: "#transport_arrival_date"})]
}
)

