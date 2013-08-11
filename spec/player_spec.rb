require 'player'
require 'round'
require 'dice'

describe Player do
	let(:player) { Player.new }
	let(:round) { Round.new }

	it 'places pass line bet' do
		
		player.make_pass_bet('pass', 5)
		player.chip_count.should == 95
		
	end

	it 'places pending come bet' do

			round.point = 6
			player.make_come_bet(5)
			player.pending_come_bet_amount.should == 5

	end

	it 'places come bet after roll' do

		player.pending_come_bet_amount = 5
		roll_result = 8
		player.come_bets = round.place_come_bet(player, roll_result)
		player.come_bets.should == [{:amount =>5,:point =>8}]

	end

	it 'places odds on pass line bet' do

		player.pass_bet = 5
		player.place_pass_odds(player.pass_bet * 2)
		player.pass_odds.should == 10
	end

end