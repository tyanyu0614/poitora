crumb :root do
  link "Home", root_path
end

crumb :plans do
  link "旅行記事一覧", plans_path
  parent :root
end

crumb :plan_show do
  link "旅行記事詳細", plan_path
  parent :plans
end

crumb :user_show do
  link "ユーザー詳細", user_path
  parent :plans
end