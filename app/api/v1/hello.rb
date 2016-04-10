module V1
  class Hello < Base

    #
    # As example, simply return hello message
    resource :hello do
      desc 'Say Hello'
      get :say do
        'Hello'
      end
    end

  end
end