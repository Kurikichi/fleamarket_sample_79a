
crumb :root do
  link "トップページ", root_path
end

crumb :users_new do
  link "会員情報入力", users_path
  parent :root
end

crumb :users_delivery_address do
  link "住所情報登録", users_path
  parent :users_new
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :login do
  link "ログイン", users_path
  parent :root
end

crumb :logout do
  link "ログアウト", edit_user_path
  parent :mypage
end

crumb :products_new do
  link "商品出品", products_path
  parent :mypage
end

crumb :products_show do
  link "商品詳細"
  parent :root
end

crumb :products_edit do
  link "商品編集", products_path
  parent :products_show
end

crumb :card_index do
  link "マイページ", new_card_path
  parent :root
end

crumb :card_new do
  link "クレジットカード入力画面", new_credit_card_path
  parent :mypage
end

crumb :card_show do
  link "カード登録一覧", show_credit_card_path
  parent :card_index
end

crumb :category_index do
  link "カテゴリー一覧", categories_path
end

crumb :parent_category do |category|
  category = Category.find(params[:id]).root
  link "#{category.name}", category_path(category)
  parent :category_index
end

crumb :child_category do |category|
  category = Category.find(params[:id])
  if category.has_children?
    link "#{category.name}", category_path(category)
    parent :parent_category

  else
    link "#{category.parent.name}", category_path(category.parent)
    parent :parent_category
  end
end

crumb :grandchild_category do |category|
  category = Category.find(params[:id])
  link "#{category.name}", category_path(category)
  parent :child_category
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).