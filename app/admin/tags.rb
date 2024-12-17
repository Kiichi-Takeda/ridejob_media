ActiveAdmin.register Tag do
  # 許可するパラメータ
  permit_params :name

  # 検索フィルタの設定
  filter :name
  filter :created_at

  # 一覧画面のカスタマイズ
  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end

  # 詳細画面のカスタマイズ
  show do
    attributes_table do
      row :id
      row :name
      row :created_at
      row :updated_at
    end
  end

  # フォーム画面のカスタマイズ
  form do |f|
    f.inputs "Tag Details" do
      f.input :name
    end
    f.actions
  end
end