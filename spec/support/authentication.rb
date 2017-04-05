def log_in_as_user(user)
  visit login_path
  fill_in "Email", with: user.email
  fill_in "Password", with: "password"
  click_on "Log in"
end
