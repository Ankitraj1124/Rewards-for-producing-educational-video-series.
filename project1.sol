// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract project{
    // Declare token information
    string public name = "EduVideoReward";
    string public symbol = "EVR";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    uint256 public rewardPerVideo = 1000 * (10 ** uint256(decimals)); // Reward per video in tokens
    uint256 public videoCount;

    // Mapping for storing user balances
    mapping(address => uint256) public balances;

    // Mapping for storing the video details
    struct Video {
        uint256 videoId;
        address creator;
        string videoTitle;
        uint256 rewardAmount;
        bool isApproved;
    }

    // Store video information
    mapping(uint256 => Video) public videos;

    // Events to emit when rewards are distributed or videos are uploaded
    event VideoUploaded(uint256 videoId, address indexed creator, string videoTitle);
    event RewardDistributed(address indexed creator, uint256 rewardAmount);
    event VideoApproved(uint256 videoId, address indexed approver);

    // Modifier to ensure only the video creator can upload or approve
    modifier onlyCreator(uint256 videoId) {
        require(msg.sender == videos[videoId].creator, "Only video creator can perform this action.");
        _;
    }

    modifier onlyApproved(uint256 videoId) {
        require(videos[videoId].isApproved, "Video must be approved to receive rewards.");
        _;
    }

    // Constructor to initialize contract with total supply of tokens
    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply * (10 ** uint256(decimals)); // Initial supply
        balances[msg.sender] = totalSupply; // Assign initial supply to contract deployer
    }

    // Function to upload a new educational video
    function uploadVideo(string memory _videoTitle) public {
        videoCount++;
        videos[videoCount] = Video(videoCount, msg.sender, _videoTitle, 0, false);
        emit VideoUploaded(videoCount, msg.sender, _videoTitle);
    }

    // Function to approve a video and release reward
    function approveVideo(uint256 videoId) public {
        require(videos[videoId].creator != address(0), "Video does not exist.");
        require(!videos[videoId].isApproved, "Video already approved.");
        
        // Mark the video as approved
        videos[videoId].isApproved = true;
        videos[videoId].rewardAmount = rewardPerVideo;

        // Distribute the reward to the video creator
        balances[msg.sender] -= rewardPerVideo;
        balances[videos[videoId].creator] += rewardPerVideo;

        emit VideoApproved(videoId, msg.sender);
        emit RewardDistributed(videos[videoId].creator, rewardPerVideo);
    }

    // Function to get the balance of a user
    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }

    // Function to transfer tokens
    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        return true;
    }

    // Function to withdraw tokens (for contract owner)
    function withdrawTokens(uint256 amount) public {
        require(msg.sender == address(this), "Only contract owner can withdraw tokens");
        require(balances[address(this)] >= amount, "Insufficient contract balance");
        balances[address(this)] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
