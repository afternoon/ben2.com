---
layout: post
title: Personal Finance Dashboards For UK Customers
date: '2012-10-04T14:26:48+01:00'
tags:
- pfm
tumblr_url: https://aftnn.org/post/47880398357/personal-finance-dashboards-uk-customers
---
<p>The current crop of Personal Finance Management (PFM) tools collect data from your bank accounts and cards and try to make sense of it all. Generally they do a bad job of this. Getting the data in is time-consuming and error-prone. The analyses are unhelpful. You get pretty graphs that tell you nothing.</p>

<p>The serious options for UK customers right now are <a href="http://lovemoney.com">LoveMoney</a> and <a href="http://www.moneydashboard.com/">Money Dashboard</a>.</p>

<p>Both tools are very similar. They pull data from your bank account using Yodlee&rsquo;s API. They display transactions and analysis of your spending.</p>

<h2>Transactions</h2>

<p>Transactions are categorised. This is done automatically where possible. That identification process varies in it&rsquo;s accuracy. Correct categorisation is vital for the analysis to be accurate. LoveMoney showed my monthly spending on health insurance as unexpectedly high, they had categorised my mortgage payment as health insurance payments.</p>

<p>Money Dashboard has a huge list of categories. LoveMoney has a small, more manageable list. The categories they present are too specific, e.g. gym instead of fitness. Money Dashboard&rsquo;s list satisfies my desire to be accurate, but took a bit longer to find my way around.</p>

<p>None of the dashboards I&rsquo;ve tried can understand money moving between accounts. They all show both sides of the transaction separately.</p>

<h2>Confusing interfaces, poor performance</h2>

<p>LoveMoney&rsquo;s interface is more generally friendly. It&rsquo;s easier to find your way around and understand the data. A tiny example: transactions are marked with the icon of the account they came from. It&rsquo;s easier to understand than Money Dashboard&rsquo;s more abstract colour coding.</p>

<p>Both tools are really slow. This is possibly because they&rsquo;re pulling data from Yodlee&rsquo;s API for every request. The slowness increases the friction of adding accounts and categorising events.</p>

<p>Yodlee&rsquo;s system for capturing credentials doesn&rsquo;t provide enough validation feedback. For example, I had to make a few guesses on what format sort code should be in for one account (it&rsquo;s 2012, validation should be solved).</p>

<h2>Analysis</h2>

<p>LoveMoney breaks down spending into categories and shows both this month&rsquo;s spending and the monthly average for each category. This is quite a helpful tool.</p>

<p>Money Dashboard displays categories as a pie chart, money in and out and balance trends. I like the latter because it gives me an indication of how my savings are going.</p>

<h2>Budgeting</h2>

<p>Money Dashboard allows you to set goals, e.g. saving for a rainy day. The data driving these need to be updated manually. They also have a budgeting tool which tries to predict monthly spending cash. My numbers were incomprehensible.</p>

<p>LoveMoney suffers from the same problem. Their analysis of the month so far was that I&rsquo;m in a huge deficit, when all I had done is make a large transfer to my savings account. I had added the savings account so this was disappointing.</p>

<h2>My User Stories</h2>

<p>I&rsquo;m frustrated with PFM tools. I like the idea, but the implementations don&rsquo;t answer my financial questions.</p>

<h3>How am I doing on my retirement saving?</h3>

<p>Instead of tagging every transaction, I could nominate accounts or a subset of transactions as saving for retirement. These would be easy to spot heuristically.</p>

<h3>Can I afford to buy this expensive item this month?</h3>

<p>Answer: No. Better answer: Do I have enough of my genuinely disposable income left? Understanding what transactions are regular outgoings and which are genuinely disposable is key to this. Whether I spent the money on books or stuff for my bike is less important to me.</p>
