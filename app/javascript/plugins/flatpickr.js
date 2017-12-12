import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr(".datepicker", {
  altFormat: 'd-m-Y'
})

flatpickr("#transport_departure_date", {
 altFormat: 'd-m-Y',
  // plugins: [new rangePlugin({ input: "#transport_arrival_date"})]
})

flatpickr("#accommodation_arrival_date", {
  altFormat: 'd-m-Y',
  plugins: [new rangePlugin({ input: "#accommodation_departure_date"})]
}
)

