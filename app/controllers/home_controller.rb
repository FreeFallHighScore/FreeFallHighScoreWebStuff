require 'lib/hash'

class HomeController < ApplicationController
  def index
  end

  def test
    @videos = Video.by_drop_time
  end

  def about
  end

  def lifevests
  end

  def disclaimer
  end
end
