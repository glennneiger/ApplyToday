-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2016 at 03:06 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apply_today`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `creator_id` varchar(100) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `position` varchar(200) NOT NULL,
  `job_url` varchar(200) DEFAULT NULL,
  `applied_date` date DEFAULT NULL,
  `resume_version` varchar(100) DEFAULT NULL,
  `contact` varchar(200) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `creator_id`, `company_name`, `position`, `job_url`, `applied_date`, `resume_version`, `contact`, `status`, `created_date`) VALUES
(2, 'vradha@vt.edu', 'Amazon', 'SDET intern', 'www.amazon.jobs', '2016-09-15', 'V5', 'Vijay Gopal', 'Applied', '2016-10-16 03:58:12'),
(4, 'vradha@vt.edu', 'MicroStrategy', 'Software Engineer', 'www.microstrategy.com/jobs', '2016-10-10', 'V2', 'Christophe', 'Selected', '2016-10-17 03:37:01'),
(5, 'vradha@vt.edu', 'Microsoft Corp.', 'Software Engineer Intern', 'www.microsoft.com/careers', '2016-09-21', 'V4', 'Rathna', 'Applied', '2016-10-17 03:38:15'),
(6, 'vradha@vt.edu', 'Google', 'SDE', 'www.google.com/jobs', '2016-01-01', 'V1', 'Kathy', 'Applied', '2016-10-17 03:38:24'),
(7, 'admin', 'LinkedIn', 'SDET', 'www.linkedin.com', '2016-10-10', 'V5', '', 'Applied', '2016-10-17 23:45:43'),
(8, 'admin', 'Cisco', 'SE', 'www.cisco.com/jobs', '2016-10-10', 'V5', 'Sudharshan', 'Applied', '2016-10-17 23:45:55'),
(9, 'admin', 'Yelp', 'Software Engineer', '', '2016-10-09', '', '', 'Applied', '2016-10-17 23:46:03'),
(11, 'vradha@vt.edu', 'Hulu', 'SE', 'www.hulu.com/jobs', '2016-05-10', 'V5', '', 'Applied', '2016-10-17 05:37:55'),
(15, 'admin', 'Teradata', 'Software Engineer Intern', 'www.teradata.com/jobs', '2016-10-17', 'V4', 'Piyush', 'Applied', '2016-10-17 23:58:05'),
(17, 'vradha@vt.edu', 'Lyft', 'SDET Intern', 'www.lyft.com/careers', '2017-12-10', 'V4', '', 'Applied', '2016-10-18 00:00:07'),
(18, 'admin', 'Intel', 'SE', 'www.intel.com/jobs', '2016-09-10', 'V3', 'Namitha', 'Applied', '2016-10-18 00:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `suggested_jobs`
--

CREATE TABLE `suggested_jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `summary` text NOT NULL,
  `job_desc` text NOT NULL,
  `img_url` varchar(200) NOT NULL,
  `link_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suggested_jobs`
--

INSERT INTO `suggested_jobs` (`id`, `title`, `location`, `summary`, `job_desc`, `img_url`, `link_url`) VALUES
(4, 'Software Engineer', 'Cisco, CA', 'We are looking for a talented Software Engineer/Tester to be part of the UI team. Experience in software design and human interaction.', 'Come explore the Internet of Everything\r\n\r\nWeâ€™re the people who made the Internet what it is today. From its early days of simple connectivity to the future of the Internet of Everything, weâ€™ve pioneered it every step of the way. Why apply for Internship Jobs with Cisco? Weâ€™re building the best team in the business so we can continue to change the way the world works, lives, plays and learns by connecting the unconnected. Working together and sharing ideas, we innovate our customers'' businesses all over the world. Our partners and customers demand the best from their technology, and we are up for the challenge. Are you? Explore Internship Jobs at Cisco. Join us and help us become the #1 IT Company in the World.\r\n\r\nPlease join our Talent Network to receive updates about Internship Jobs matching your interests.', 'icon4.png', 'https://jobs.cisco.com/key/software-engineer-intern.html'),
(5, 'Software Engineering Intern', 'Square space, MA', 'The ideal candidate is self-directed and motivated to continually iterate on delivering the best possible solution.', 'Job description\r\nMake a difference and be part of something bigger this summer in Illumina''s iAspire Internship Program. Our company mission is to improve human health by unlocking the power of the genome. If that inspires you, let''s talk. We''ve built a culture fueled by innovation, collaboration and openness, and established ourselves as the global leader in DNA sequencing and array-based technologies. Our people and our technology change lives by driving advancements in life sciences, oncology, reproductive health, agriculture and other emerging markets. We are deeply passionate about what we do, because we know that our work has the power to improve lives.\r\n\r\nWe''re an established company with a track record of phenomenal growth. Our revenue grew from $10 million in 2002 to approximately $2.2 billion in 2015. Our growth isn''t just revenue, we''ve been hiring the best and the brightest. Perhaps that''s why MIT has ranked Illumina near the top of its World''s Smartest Companies list three years running, including #1 in 2014. If you thrive in a brilliant, fast-paced, and mission-driven environment, Illumina is the place for you imagine the possibilities.\r\n\r\nThe Intern In This Role Will Focus On The Following\r\n\r\nContribute to the design and development of cutting-edge software solutions\r\nParticipate in identifying new technologies and network with technical thought leaders in the department\r\nTake on responsibility for the design and development of complex integrations between BaseSpace LIMS and laboratory systems including scientific instruments\r\nParticipate in all aspects of agile development process, from iteration planning to daily scrum meetings to end-of-iteration demos\r\nValidate data in system tests using various tools\r\nTroubleshoot system problems\r\n', 'icon1.png', 'https://www.squarespace.com/about/careers?gh_jid=238727&gh_src=srwdy8'),
(8, 'Software Engineering Intern', 'General Dynamics Mission Systems, MA, US ', 'General Dynamics Mission Systems (GDMS), a market leader and technology innovator, is seeking talented professionals to deliver cutting ...', 'Responsibilities for this Position:\r\n\r\nGeneral Dynamics Mission Systems (GDMS), a market leader and technology innovator, is seeking talented professionals to deliver cutting edge solutions to our customers.\r\n\r\nResponsibilities:\r\n\r\nGDMS has an immediate opening for an Intern - Clearable Software Engineer (PAID) to join our team. The position provides an opportunity to work on projects that support some of our nationâ€™s fundamental defense services. GDMS employees work closely with esteemed customers to develop solutions that allow them to carry out high-stakes national security missions.\r\n\r\nThe selected candidate will work with collaborative teams on various technical projects associated with our core mission. In addition to receiving a competitive wage, the Intern - Clearable Software Engineer (PAID) will enhance their skill set by working among a talented and technically accomplished group of colleagues. Interns will also enjoy a flexible work environment where contributions are recognized and rewarded.\r\n\r\nSpecific responsibilities include:\r\nParticipate in all Agile Software Development (Scrum) activities â€“ learn the Agile software development process\r\nLearn how to write effective Java and JavaScript for a Monitoring GUI that is highly visible to customers\r\nLearn about the new Microservices architecture and how to develop software applications as a suite of independently deployable services\r\nEvaluate and make software enhancements and modifications to existing software\r\nDocument activities on Wikis and other Agile software tools (i.e. Crucible Peer Review tool, Jira software ticket tracking tool, Sonar Code Coverage, etc.)\r\nWrite effective JUnit tests for Java code and Selenium tests for GUI code\r\n\r\nThe Intern - Clearable Software Engineer (PAID) will have the opportunity to work with the following:\r\nTools: Maven, Git, Subversion, Jenkins, Sonar, Eclipse, Nexus, Jira, Crucible, Confluence, Bitbucket, Robot Framework, FailSafe\r\nTechnologies: Java 7/8, Microservices, Sprint Boot, Spring Framework, Hadoop, Accumulo, MapReduce, JavaScript (Angular, React, EXT), Google Web Toolkit (GWT), Java Message Service (JMS), Hibernate, JAXB, Bean Validation (JSR-303), JUnit, Mockito, Tomcat, Python, Linux\r\n\r\nBasic Qualifications:\r\n\r\nCandidates should demonstrate a thorough understanding of engineering technology. Intern - Clearable Software Engineers (PAID)must be enrolled in an accredited degree program with a preference for a standing of a sophomore or higher.\r\n\r\nExperience with any of the following:\r\nOperating Systems: Windows, Unix, Linux, or VM architecture\r\nProgramming: Java, JavaScript, Python\r\nDatabase: Sybase, Hibernate, MySQL, Hadoop, MapReduce, Accumulo\r\nSoftware Applications: Spring, GWT, Tomcat, JBoss Software\r\nTesting: (Automated or Manual)\r\nTools: Eclipse, Maven, Hudson, Jenkins, JUnit, Crucible, Jira, Mingle\r\nAgile Development: SCRUM methodologies\r\nConfiguration Management: GIT, Subversion, CVS\r\nSoftware Engineering Documentation\r\n\r\nThe candidate must be willing to undergo U.S. Government/DoD special access clearance process.\r\n\r\nApplicants selected will be subject to a U.S. Government security investigation and must meet eligibility requirements for access to classified information. Due to the nature of work performed within our facilities, U.S. citizenship is required.\r\n\r\nApplicants must be willing to be cleared to a high level, TS/SCI with Polygraph.', 'icon3.png', 'http://jobs.gdc4s.com/INTERN-jobs.aspx'),
(9, 'Software Engineering Intern ', 'Walmart, San Bruno, CA', 'Experience with design, editing, and programming across one or more platforms and languages (Java, JavaScript, C/C++, Perl, Python, R, ...', 'Position Summary\r\n\r\nAbout Software Engineer Interns\r\n\r\nThe teams within @WalmartLabs design, prototype and build technology-fueled products that bridge the gap between what''s next and what''s best. The engineering teams are grounded in the principles of open source. As an intern, youâ€™ll have the responsibility to make a difference on a grand scale, working on code for millions of users and taking on other challenging projects. Our interns work with very small team to create new, awesome features for millions of users.\r\n\r\nWrite code with one or more programming languages (e.g., Java, C/C++ JavaScript)\r\nFunction as a core member of an agile team working on API specs, conducting code reviews and testing in ongoing sprints, or doing proof of concepts/automation tools\r\nDesign and develop new customer-facing applications on multiple channels like native iOS, Android, web, social integration, java services / APIs\r\nDesign and implement web-enabled systems for data collection\r\nWork on the scalability, resilience, and efficiency of backend components\r\nWork closely with teams across product engineering, product management and interaction design\r\n\r\nPosition Description\r\n\r\nYour Intern Program Experience\r\n\r\nFar beyond your specific assignment, the program immerses you in business, allows you to develop cutting edge technology, and shows off your socials skills, all in-between a lot of fun! Over the 10 to 11 week period you connect with executives, learn advanced skills, participate in HackDay, and network at social events. Whether you are playing in the Intern Olympics or going to a Giants game, there is always something going on. With the San Francisco Bay Area as your playground the opportunities both inside and outside of work are endless!\r\n\r\nAbout You\r\n\r\nMinimum Qualifications\r\n\r\nA visionary engineer or technologist with a passion for learning new technologies, programming wizardry, and translating them into working software.\r\nExperience with software design, development and automated testing\r\nFamiliar with agile or other rapid application development met\r\nExperience with design, editing, and programming across one or more platforms and languages (Java, JavaScript, C/C++, Perl, Python, R, Ruby, Shell Scripting, CSS, HTML, HTML5), data structure fundamentals and relational databases, Big Data, Cloud Computing, (Hadoop/HBase/MapReduce), Linux system and networks\r\nDemonstrated experience with object-oriented design and coding with variety of languages\r\nUnderstanding of XML, JSON , Web Services technologies, and, with experience in multi-threaded programming a plus\r\nAndroid, iOS, or Windows Phone development experience is strongly preferred, but not required\r\nPassionate about user experience\r\nAn awesome programmer with high levels of creativity and quick solving capabilities to change the world in a huge way!\r\n\r\nEDUCATIONAL REQUIREMENTS\r\nCurrently enrolled and pursuing a Bachelors, Masters, or PhD in Computer Science, Software Engineering, Computer Engineering, Electrical Engineering or a related field.\r\nGraduating December 2017 or later\r\n\r\nAdditional Preferred Qualifications\r\nNone at this time.\r\n\r\nReq ID: 734081BR', 'default.png', 'https://jobs.walmart.com/us/jobs/793776-5022/SAN-BRUNO-CA-Software-Engineer-Intern-Front%257CBack%257CCloud%257CMobile%257CWeb-Summer-2017?lang=en-US&codes=Bayard'),
(20, 'Software Engineering Intern', 'The Mathworks, Massachussets ', 'MathWorks is looking for Interns who are actively pursuing a B.S. in Computer Science. MATLAB knowledge or experience is a plus.', 'Job Summary\r\n\r\nMathWorks is looking for Interns who are actively pursuing a B.S. in Computer Science. As part of this program, you will receive a combination of practical experience and training in a work environment that fosters and rewards cooperation, teamwork, learning, and fun. As an intern you will work on technical projects with our experienced software engineers.\r\n\r\nResponsibilities\r\n\r\nAfter training on MathWorks development processes and tools, you will work with a development team on implementing features such as algorithms or UIs for a future release of one of our 90+ products, or help to develop automated tests to verify that features in MATLAB are working as designed.\r\n\r\nThis internship will prepare you for a career at MathWorks starting in our â€œComputer Science Development Groupâ€.\r\n\r\nMinimum Qualifications\r\n\r\nCandidates for this position must be authorized to work in the United States on a full-time basis for any employer without restriction.\r\nVisa sponsorship will not be provided for this position.\r\nAdditional Qualifications\r\n\r\nQualifications Required\r\n\r\nWorking towards a Bachelorâ€™s degree in Computer Science\r\n\r\nQualifications Preferred\r\n\r\n3 month full-time commitment\r\nObject Oriented Programming experience (One or more of C++, Java OR JavaScript)\r\nStrong Communication skills\r\nStrong academic record\r\nMATLAB knowledge or experience is a plus', 'icon2.png', 'https://www.mathworks.com/company/jobs/opportunities/10071-software-engineering-intern');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'vradha@vt.edu', 'foobar'),
(2, 'admin', 'foobar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suggested_jobs`
--
ALTER TABLE `suggested_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `suggested_jobs`
--
ALTER TABLE `suggested_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
