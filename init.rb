# frozen_string_literal: true

Redmine::Plugin.register :polls do
  name 'Polls plugin'
  author 'tastytea'
  description 'This is a polls plugin for Redmine for an interview in redmineup.com'
  version '0.0.1'
  url 'https://www.redmine.org/projects/redmine/wiki/Plugin_Tutorial'
  author_url 'hhttp://linkedin.com/in/artyom-m-8287ab1b8'

  require_dependency 'polls_hook_listener'
  # permission :polls, { polls: [:index, :vote] }, public: true
  project_module :polls do
    permission :view_polls, polls: :index
    permission :vote_polls, polls: :vote
  end

  menu :project_menu, :polls, {controller: 'polls', action: 'index'}, caption: 'Polls', after: :activity, param: :project_id
  delete_menu_item :project_menu, :news

  settings default: {'empty' => true}, partial: 'settings/poll_settings'
end
