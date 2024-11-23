-include .env

build:; forge build
deploy-sepolia:

	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url https://eth-sepolia.g.alchemy.com/v2/6awycKAdrh7ejUoOfYeoevi45RXf0AXt --private-key de10ccbf74ee5b3b59c2c41725fa860ce124ed021b8b2b28f8c0249bff0451bc --broadcast --verify --etherscan-api-key E7KDSE8ARWUZHB95VSJB38BB2QRZPEPI6K -vvvv