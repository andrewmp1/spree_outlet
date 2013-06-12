###
Set up Application
###

exports = this


exports.App = Em.Application.create(
  # Logs router transitions
  LOG_TRANSITIONS: true
  # Logs when ember creates classes for you(route,controller)
  LOG_ACTIVE_GENERATION: true
)
