Then /^"(.*)" should be the author of "(.*)"$/ do |author_name, title|
	article = Article.find_by_title(title)
	assert article.author == author_name
end

When /^I add a comment "(.*)" to "(.*)"$/ do |comment, title|
	article = Article.find_by_title(title)
	article.comments << Comment.create(:author => "admin", :body => comment, :article => article)
end

Then /^article "(.*)" should have comments "(.*)" and "(.*)"$/ do |title, c1, c2|
	article = Article.find_by_title(title)
	c1seen = false
	c2seen = false
	article.comments.each do |comment|
		if comment.body == c1
			c1seen = true
		end
		if comment.body == c2
			c2seen = true
		end
	end
	assert c1seen and c2seen
end
