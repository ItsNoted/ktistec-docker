- content_for "title" do
  | ##{hashtag}
- if env.account?
  .ui.thread.segments
    .ui.segment
      p
        a href=hashtag_path ##{hashtag}
        - if (count = Tag::Hashtag.count_objects(hashtag)) > 0
          span< #{pluralize(count, "hashtag")}
    turbo-frame#tag_page_tag_controls
      .ui.basic.segment
        - if follow
          == form_button "Unfollow", unfollow_hashtag_path
        - else
          == form_button "Follow", follow_hashtag_path, button_class: "ui button primary"
section.ui.feed
  - collection.each do |object|
    == object_partial(env, object)
== paginate(env, collection)
