CREATE TABLE `radios` (
  `id` tinyint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Alle radio''s';

INSERT INTO `radios` (`id`, `name`, `url`, `citizenid`) VALUES
(0, 'Radio Uitzetten', NULL, NULL),
(1, 'Slam FM - Hardstyle', 'https://streaming.slam.nl/web11_mp3', NULL),
(2, 'Slam FM - Mixmarathon', 'https://stream.slam.nl/web13_mp3', NULL),
(3, 'Slam FM - Non-Stop', 'https://stream.radiocorp.nl/web10_mp3', NULL),
(4, 'Slam FM - Live!', 'https://stream.slam.nl/slam_mp3', NULL),
(5, '538', 'https://20103.live.streamtheworld.com/RADIO538.mp3 ', NULL),
(6, '538 - Top 50', 'https://20853.live.streamtheworld.com/TLPSTR13.mp3', NULL),
(7, '538 - Dance Department', 'https://20403.live.streamtheworld.com/TLPSTR01.mp3', NULL),
(8, '538 - Non-Stop', 'https://20103.live.streamtheworld.com/TLPSTR09.mp3', NULL),
(9, '538 - Hitzone', 'https://20863.live.streamtheworld.com/TLPSTR11.mp3', NULL),
(10, '538 - Party', 'https://21293.live.streamtheworld.com/TLPSTR16.mp3', NULL),
(11, '100% NL', 'https://stream.100p.nl/100pctnl.mp3', NULL),
(12, '100% NL - Feest', 'https://stream.100p.nl/web01_mp3', NULL),
(13, 'Q-Music', 'https://icecast-qmusicnl-cdp.triple-it.nl/Qmusic_nl_live_96.mp3', NULL),
(14, 'Q-Music - Foute Uur', 'https://icecast-qmusicnl-cdp.triple-it.nl/Qmusic_nl_fouteuur_96.mp3', NULL),
(15, 'Q-Music - Non-Stop', 'https://icecast-qmusicnl-cdp.triple-it.nl/Qmusic_nl_nonstop_96.mp3', NULL),
(16, 'FunX', 'https://icecast.omroep.nl/funx-bb-mp3', NULL),
(17, 'FunX - Slow Jamz', 'https://icecast.omroep.nl/funx-slowjamz-bb-mp3', NULL),
(18, 'FunX - HipHop', 'https://icecast.omroep.nl/funx-hiphop-bb-mp3', NULL),
(19, 'FunX - Dance', 'https://icecast.omroep.nl/funx-dance-bb-mp3', NULL),
(20, 'FunX - Reggae', 'https://icecast.omroep.nl/funx-reggae-bb-mp3', NULL);

--
ALTER TABLE `radios`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `radios`
  MODIFY `id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;