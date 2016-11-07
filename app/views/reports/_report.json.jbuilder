json.extract! report, :id, :first_name, :last_name, :email, :content, :comment, :grade, :created_at, :updated_at
json.url report_url(report, format: :json)