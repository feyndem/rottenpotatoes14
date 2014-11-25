class Moviegoer < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    Moviegoer.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"]
    )
  end

  def moviegoer_params
    params.require(:moviegoer).permit(:uid, :provider, :name)
  end

end
