class ScoreboardController < ApplicationController
  layout nil

  def index
    respond_to do |format|
      format.html
      format.json { render :json => get_top_scores }
    end
  end

  def get_top_scores
    scores = []
    people = Person.all

    people.each do |person|
      person_hash = Hash.new
      person_hash['name'] = "#{person.first_name} #{person.last_name}"
      person_hash['score'] = person.score
      scores << person_hash
    end

    logger.debug "*** scores: #{scores} ***"

    scores = scores.sort do |a,b|
      b['score'] <=> a['score']
    end

    scores[0,7]
  end

protected

  def authorize!
  end

end
