json.array! @articles do |article|
    json.extract! article, :id,:title,:body
        json.comments article.comments
end