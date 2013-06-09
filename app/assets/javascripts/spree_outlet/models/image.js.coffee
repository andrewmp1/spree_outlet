attr = Ember.attr

App.Image = Ember.Model.extend(
	id: attr()
	alt: attr()
	attachment_content_type: attr()
	attachment_file_name: attr()
	attachment_height: attr()
	attachment_updated_at: attr()
	attachment_url: attr()
	attachment_width: attr()
	position: attr()
	type: attr()
	viewable_id: attr()
	viewable_type: attr()
)