# frozen_string_literal: true

class PollsController < ApplicationController
  before_action :find_project, :authorize, only: :index

  def index
    @polls = Poll.all
  end

  def vote
    poll = Poll.find(params[:id])
    poll.vote(params[:answer])
    if poll.save
      flash[:notice] = 'Vote saved.'
    end
    redirect_to polls_path(project_id: params[:project_id])
  end

  private

  def find_project
    # @project variable must be set before calling the authorize filter
    #I'm not sure how to patch Project model to add relation :has_many, so project and polls are not related by now
    @project = Project.find(params[:project_id])
  end
end
