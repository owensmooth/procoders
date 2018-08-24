require "rails_helper"

describe "User Mailer", :type => :mailer do
  it "Sends a email when new account created" do
    user = create :user
    mail = UserMailer.with(user: user).welcome_email

    expect(mail.to).to have_content("test@test.com")
    expect(mail.from).to have_content("notifications@example.com")
  end

  it "Sends a email with correct details" do
    user = create :user
    mail = UserMailer.with(user: user).welcome_email

    expect(mail.subject).to match("Welcome to the Blog")
    expect(mail.body.encoded).to have_content("Welcome to onsmooth dev blog")
  end
end