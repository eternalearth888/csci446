atom_feed do |feed|
	feed.title "Who requested #{@villain.name}"

	latest_order = @villain.orders.sort_by(&:updated_at).last
	feed.updated( latest_order && latest_order.updated_at)

	@villain.orders.each do |order|
		feed.entry(order) do |entry|
			entry.title "Request #{order.id}"
			entry.summary :type => 'xhtml' do |xhtml|
				xhtml.p "Armed Convey sent to #{order.address}"

				xhtml.table do
					xhtml.tr do
						xhtml.th 'Villain'
						xhtml.th 'Number of'
					end
					order.line_items.each do |item|
						xhtml.tr do
							xhtml.td item.villain.name
							xhtml.td item.quantity
						end
					end
					xhtml.p "Requested by #{order.pay_type}"
				end
			end
			end
		end
	end
end
