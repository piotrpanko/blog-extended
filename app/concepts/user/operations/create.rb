module User::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: User::Contract::Create)
    end

    step Subprocess(Present)
    step Contract::Validate(key: :user)
    step Contract::Persist()
    step :notify!

    def notify!(ctx, model:, **)
      ctx["result.notify"] = Rails.logger.info "New user created! #{model.name}"
    end
  end
end