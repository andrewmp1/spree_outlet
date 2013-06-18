###
Set up Application
###

exports = this

exports.App = Em.Application.create(
  # Logs router transitions
  LOG_TRANSITIONS: true
  # Logs when ember creates classes for you(route,controller)
  LOG_ACTIVE_GENERATION: true
  apiURL: "/api"
)

# Test DATA
window.billAddress =
  "firstname": "John"
  "lastname": "Doe"
  "address1": "7735 Old Georgetown Road"
  "city": "Bethesda"
  "phone": "3014445002"
  "zipcode": "20814"
  "state_id": 49
  "country_id": 49

window.shipAddress =
  "firstname": "John"
  "lastname": "Doe"
  "address1": "7735 Old Georgetown Road"
  "city": "Bethesda"
  "phone": "3014445002"
  "zipcode": "20814"
  "state_id": 49
  "country_id": 49
# End Test DATA