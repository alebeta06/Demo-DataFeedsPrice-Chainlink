// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceOracle {
    AggregatorV3Interface internal btcUsdPriceFeed; // Chainlink BTC/USD price feed contract
    AggregatorV3Interface internal ethUsdPriceFeed; // Chainlink ETH/USD price feed contract
    AggregatorV3Interface internal linkUsdPriceFeed; // Chainlink LINK/USD price feed contract

    constructor() {
        // Mumbai Testnet addresses for BTC/USD, ETH/USD andLINK/USD price feeds
        btcUsdPriceFeed = AggregatorV3Interface(0x007A22900a3B98143368Bd5906f8E17e9867581b);
        ethUsdPriceFeed = AggregatorV3Interface(0x0715A7794a1dc8e42615F059dD6e406A6594651A);
        linkUsdPriceFeed = AggregatorV3Interface(0x1C2252aeeD50e0c9B64bDfF2735Ee3C932F5C408);
    }

    /**
     * Returns the latest BTC/USD price.
     */
    function getBtcUsdPrice() public view returns (int) {
        (
            /* uint80 roundID */,
            int answer,
            /* uint startedAt */,
            /* uint timeStamp */,
            /* uint80 answeredInRound */
        ) = btcUsdPriceFeed.latestRoundData();
        return answer;
    }

    /**
     * Returns the latest ETH/USD price.
     */
    function getEthUsdPrice() public view returns (int) {
        (
            /* uint80 roundID */,
            int answer,
            /* uint startedAt */,
            /* uint timeStamp */,
            /* uint80 answeredInRound */
        ) = ethUsdPriceFeed.latestRoundData();
        return answer;
    }

    /**
     * Returns the latest LINK/USD price.
     */
    function getLinkUsdPrice() public view returns (int) {
        (
            /* uint80 roundID */,
            int answer,
            /* uint startedAt */,
            /* uint timeStamp */,
            /* uint80 answeredInRound */
        ) = linkUsdPriceFeed.latestRoundData();
        return answer;
    }
}