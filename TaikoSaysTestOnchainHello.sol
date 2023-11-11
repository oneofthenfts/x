// SPDX-License-Identifier: MIT
// thanks HashLips and thirdweb I added a little relevance to the code that these guys wrote, I got an interesting experience when I watched and read their guides on creating an online NFT collection. this is just a test thing and my first experience when I do something like this

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

import "./Base64.sol";

contract TaikoSaysTestOnchainHello is ERC721Enumerable, Ownable {
    using Strings for uint256;

    string[] private Hello = [
        "Hello",
        unicode"toki",
        unicode"nuqneH",
        unicode"ሰላም",
        unicode"Përshëndetje",
        unicode"Hallo",
        unicode"مرحبا",
        unicode"Բարև",
        unicode"Salam",
        unicode"Kaixo",
        unicode"নমস্কার",
        unicode"Kuzu zangpo la",
        unicode"Zdravo",
        unicode"zdraveĭte",
        unicode"ဟယ်လို",
        unicode"ជំរាបសួ",
        unicode"哈囉",
        unicode"Moni",
        unicode"Bok",
        unicode"Ahoj",
        unicode"Hej",
        unicode"Hallo",
        unicode"Tere",
        unicode"سلام",
        unicode"Bula",
        unicode"Hei",
        unicode"Bonjour",
        unicode"გამარჯობა",
        unicode"Γεια σας",
        unicode"Sannu",
        unicode"Aloha",
        unicode"שלום",
        unicode"Nyob zoo",
        unicode"Szia",
        unicode"Halló",
        unicode"Ndewo",
        unicode"Ciao",
        unicode"こんにちは",
        unicode"ಹಲೋ",
        unicode"Сәлеметсіз бе",
        unicode"ສະບາຍດີ",
        unicode"Muraho",
        unicode"Moa oti",
        unicode"안녕하세요",
        unicode"Салам",
        unicode"ສະບາຍດີ",
        unicode"Sveiki",
        unicode"Wabula",
        unicode"Здраво",
        unicode"Manao ahoana",
        unicode"Hai",
        unicode"നമസ്കാരം",
        unicode"你好",
        unicode"Kia ora ",
        unicode"Yokwe",
        unicode"Сайн байна уу",
        unicode"Sawubona",
        unicode"नमस्ते",
        unicode"Moni",
        unicode"Akkam",
        unicode"Cześć",
        unicode"Olá",
        unicode"ਸਤ ਸ੍ਰੀ ਅਕਾਲ",
        unicode"Salut",
        unicode"Привет",
        unicode"Talofa",
        unicode"Lumela",
        unicode"Dumela",
        unicode"Mhoro",
        unicode"හෙලෝ",
        unicode"Ahoj",
        unicode"",
        unicode"Živijo",
        unicode"Salaam alaykum",
        unicode"Hola",
        unicode"Odi",
        unicode"Habari",
        unicode"Sawubona",
        unicode"Hej",
        unicode"Kamusta",
        unicode"Ia ora na",
        unicode"Салом",
        unicode"வணக்கம்",
        unicode"నమస్తే",
        unicode"สวัสดี",
        unicode"ሰላም",
        unicode"Mālō e lelei",
        unicode"Merhaba",
        unicode"Вітаю",
        unicode"اسلام",
        unicode"Salom",
        unicode"Xin chào",
        unicode"Molo",
        unicode"Avuxeni",
        unicode"Bawo ni",
        unicode"Sawubona"
    ];
    string[] private GM = [
        "accomplish",
        "accepted",
        "absolutely",
        "admire",
        "achievement",
        "active",
        "adorable",
        "affirmative",
        "appealing",
        "approve",
        "amazing",
        "awesome",
        "beautiful",
        "believe",
        "beneficial",
        "bliss",
        "brave",
        "brilliant",
        "calm",
        "celebrated",
        "champion",
        "charming",
        "congratulation",
        "cool",
        "courageous",
        "creative",
        "dazzling",
        "delightful",
        "divine",
        "effortless",
        "electrifying",
        "elegant",
        "enchanting",
        "energetic",
        "enthusiastic",
        "excellent",
        "exciting",
        "exquisite",
        "fabulous",
        "fantastic",
        "fine",
        "fortunate",
        "friendly",
        "fun",
        "funny",
        "generous",
        "giving",
        "great",
        "happy",
        "harmonious",
        "healthy",
        "heavenly",
        "honest",
        "honorable",
        "impressive",
        "independent",
        "innovative",
        "intelligent",
        "intuitive",
        "kind",
        "knowledgeable",
        "legendary",
        "lucky",
        "lovely",
        "marvelous",
        "motivating",
        "nice",
        "perfect",
        "phenomenal",
        "popular",
        "positive",
        "productive",
        "refreshing",
        "remarkable",
        "skillful",
        "sparkling",
        "stunning",
        "successful",
        "supporting",
        "terrific",
        "tranquil",
        "trusting",
        "vibrant",
        "wholesome",
        "worthy",
        "wonderful"
    ];
    string[] private Taiko = [
        "Taiko L2",
        "Taiko Type 1",
        "Taiko",
        "Taiko open source",
        "Taiko Decentralized",
        "Taiko",
        "Taiko web3",
        "Taiko LFG",
        "Taiko building",
        "Taiko TTKO",
        "Taiko onchain"
    ];

    constructor()
        ERC721("Taiko Says Test Onchain Hello", "TSTOH")
        Ownable(msg.sender)
    {}

    function mint() public payable {
        uint256 supply = totalSupply();
        require(supply + 1 <= 1000);

        if (msg.sender != owner()) {
            require(msg.value >= 0.0000000001 ether);
        }
    }

    function pluck(
        uint256 tokenId,
        string memory keyPrefix,
        string[] memory sourceArray
    ) internal pure returns (string memory) {
        uint256 rand = random(
            string(abi.encodePacked(keyPrefix, toString(tokenId)))
        );
        string memory output = sourceArray[rand % sourceArray.length];
        return output;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        string[8] memory parts;

        parts[
            0
        ] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="50%" height="50%" fill="#E81899" /><text x="10" y="20" class="base">';

        parts[1] = getHello(tokenId);

        parts[2] = '</text><text x="10" y="40" class="base">';

        parts[3] = getGM(tokenId);

        parts[4] = '</text><text x="10" y="60" class="base">';

        parts[6] = getTaiko(tokenId);

        parts[7] = "</text></svg>";

        string memory output = string(
            abi.encodePacked(
                parts[0],
                parts[1],
                parts[2],
                parts[3],
                parts[4],
                parts[5],
                parts[6],
                parts[7]
            )
        );

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "TSTOH #',
                        toString(tokenId),
                        '", "description": "Taiko Says Test Onchain Hello, NFT collection on Taiko testnet, says hello in different languages ", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(output)),
                        '"}'
                    )
                )
            )
        );
        output = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        return output;
    }


  function buildMetadata(uint256 tokenId) public view returns(string memory) {
      return string(abi.encodePacked(
 
                          tokenURI(tokenId)));
                          
  }

    function toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function getHello(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        return pluck(tokenId, "Hello", Hello);
    }

    function getGM(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "GM", GM);
    }

    function getTaiko(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "Taiko", Taiko);
    }

    function claim(uint256 _amount) public {
        require(_amount > 0 && _amount < 6);
        _safeMint(msg.sender, _amount);
    }

    function withdraw() public payable onlyOwner {
        (bool hs, ) = payable(0xD8072C8C4F96A17E9dc4E38252814fC0E90B7269).call{
            value: (address(this).balance * 5) / 100
        }("");
        require(hs);

        (bool os, ) = payable(owner()).call{value: address(this).balance}("");
        require(os);
    }
}
