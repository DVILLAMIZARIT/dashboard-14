-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Aug 16, 2015 at 11:38 AM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `dashboard`
--
CREATE DATABASE IF NOT EXISTS `dashboard` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `dashboard`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_calendar`
--

CREATE TABLE `tb_calendar` (
`cal_id` int(11) NOT NULL,
  `cal_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cal_date` timestamp NULL DEFAULT NULL,
  `cal_text` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `cal_place` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_contact`
--

CREATE TABLE `tb_contact` (
`contact_id` int(11) NOT NULL,
  `contact_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_num_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_num_mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_web` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_addr_street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_addr_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_addr_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_contributor`
--

CREATE TABLE `tb_contributor` (
`cont_id` int(11) NOT NULL,
  `cont_firm_id` int(11) NOT NULL,
  `cont_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cont_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cont_role` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_firm`
--

CREATE TABLE `tb_firm` (
`firm_id` int(11) NOT NULL,
  `firm_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firm_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firm_web` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firm_addr_street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firm_addr_zipcode` int(11) DEFAULT NULL,
  `firm_addr_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firm_addr_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_project`
--

CREATE TABLE `tb_project` (
`proj_id` int(11) NOT NULL,
  `proj_firm_id` int(11) NOT NULL,
  `proj_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `proj_grade` enum('1','2','3','4','5') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Most important: 5',
  `proj_date_created` date NOT NULL,
  `proj_deadline` date NOT NULL,
  `proj_contributor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `proj_status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL COMMENT '0 (open), 1 (closed)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sticker`
--

CREATE TABLE `tb_sticker` (
`stick_id` int(11) NOT NULL,
  `stick_grade` enum('1','2','3','4','5') COLLATE utf8_unicode_ci NOT NULL,
  `stick_text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_task`
--

CREATE TABLE `tb_task` (
`task_id` int(11) NOT NULL,
  `task_project_id` int(11) NOT NULL,
  `task_assigned_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `task_name` int(11) NOT NULL,
  `task_grade` enum('1','2','3','4','5') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Most important: 5',
  `task_deadline` date DEFAULT NULL,
  `task_status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL COMMENT '0 (open), 1 (closed)',
  `task_percent` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_calendar`
--
ALTER TABLE `tb_calendar`
 ADD PRIMARY KEY (`cal_id`), ADD UNIQUE KEY `cal_name` (`cal_name`), ADD UNIQUE KEY `cal_name_2` (`cal_name`,`cal_date`);

--
-- Indexes for table `tb_contact`
--
ALTER TABLE `tb_contact`
 ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `tb_contributor`
--
ALTER TABLE `tb_contributor`
 ADD PRIMARY KEY (`cont_id`), ADD UNIQUE KEY `cont_firm_id` (`cont_firm_id`,`cont_name`);

--
-- Indexes for table `tb_firm`
--
ALTER TABLE `tb_firm`
 ADD PRIMARY KEY (`firm_id`), ADD UNIQUE KEY `firm_name` (`firm_name`);

--
-- Indexes for table `tb_project`
--
ALTER TABLE `tb_project`
 ADD PRIMARY KEY (`proj_id`);

--
-- Indexes for table `tb_sticker`
--
ALTER TABLE `tb_sticker`
 ADD PRIMARY KEY (`stick_id`);

--
-- Indexes for table `tb_task`
--
ALTER TABLE `tb_task`
 ADD PRIMARY KEY (`task_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_calendar`
--
ALTER TABLE `tb_calendar`
MODIFY `cal_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tb_contact`
--
ALTER TABLE `tb_contact`
MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_contributor`
--
ALTER TABLE `tb_contributor`
MODIFY `cont_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tb_firm`
--
ALTER TABLE `tb_firm`
MODIFY `firm_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tb_project`
--
ALTER TABLE `tb_project`
MODIFY `proj_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_sticker`
--
ALTER TABLE `tb_sticker`
MODIFY `stick_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_task`
--
ALTER TABLE `tb_task`
MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT;
