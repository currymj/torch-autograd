-- Get/create dataset
local function setupData(opt)
	if not path.exists('mnist') then
	   os.execute[[
	      curl https://s3.amazonaws.com/torch.data/mnist.tgz -o mnist.tgz
	      tar xvf mnist.tgz
	      rm mnist.tgz
	   ]]
	end

	local classes = {'0','1','2','3','4','5','6','7','8','9'}
	local trainData = torch.load('mnist/train.t7')
	local testData = torch.load('mnist/test.t7')
	return trainData, testData, classes
end

return setupData