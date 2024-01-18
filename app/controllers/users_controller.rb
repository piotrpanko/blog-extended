class UsersController < ApplicationController
  def new
    run User::Operation::Create::Present do |ctx|
      @form = ctx["contract.default"]
      render
    end
  end
end