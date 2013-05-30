App.Zone = DS.Model.extend(
  name: DS.attr('string')
  description: DS.attr('string')
  zoneMembers: DS.hasMany('App.ZoneMember')
)