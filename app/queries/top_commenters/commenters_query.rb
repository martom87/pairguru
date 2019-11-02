module TopCommenters
  class CommentersQuery < BaseQuery
    def find_top_commenters(amount:)
      order_commenters_desc.limit(amount)
    end

    def by_weeks_ago
      relation.where(comments: { created_at: (Time.now - days_amount.day).midnight..(Time.now) })
    end

    def select_commenters_data
      by_weeks_ago.select("users.id, users.name, users.email, COUNT(comments.id) AS comments_amount")
    end

    def group_commenters_by_name
      select_commenters_data.group("users.id")
    end

    def order_commenters_desc
      group_commenters_by_name.order("comments_amount DESC")
    end
  end
end
