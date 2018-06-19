---
layout: post
title: An Introduction to Artificial Intelligence and Machine Learning
date: 2018/03/31
tags: ["AI","Business","Innovation","Skyline Technologies"]
---
    
Artificial Intelligence (AI) is becoming more of an important part in the solutions we craft for clients in many different industries. The term AI itself is very broad, so let’s break down some applicable concepts.
 
## Consuming - Artificial Intelligence Services ##
We can already take advantage of Artificial Intelligence (AI) by utilizing AI algorithms created by Microsoft and Google within applications we develop. This enables developers to bring AI smarts into an application without having to have a deep understanding of all the nuances of AI – enabling far more widespread adoption and implementation.
 
### Libraries Available ###
These are examples of the libraries available to developers today:
 
#### Vision ####
We can use AI libraries to process images for applications we develop. These libraries enable us to identify objects as well as caption content from the images (for example, an image contains a dog in a park). We can also use sentiment analysis to determine the mood of an individual in a photo.
 
One of our clients asked us to use facial recognition to determine if people look nervous or angry when in a shop. And another client asked us to develop a facial recognition solution to identify customers rather than manually looking through archived security cameras.
 
A great example of an application using vision AI services is Google’s real-world emoji hunt app you can use via a web browser on your phone. Check out [https://emojiscavengerhunt.withgoogle.com/](https://emojiscavengerhunt.withgoogle.com/). This application uses the web browser and JavaScript to do real-time image recognition that has you hunting emojis from the virtual world in the real world..
 
#### Speech ####
Speech-based AI platforms can take real-time speech and translate it into text, like voicemail does on most phones. You can also uniquely identify people by their voice or develop for-voice interfaces in application.
 
We are in the process of creating a hackathon with a client to develop a chatbot. The chatbot would enable users to interact with it via typing to change a password in a help desk function. This is an example of where we can develop a speech-based AI model, but consume it using text via interaction with a chatbot or voice via interaction with a digital assistant.
 
We have also used Google Chrome’s built in speech recognition to develop a voice-activated product search for a client, as well as helping clients to develop Alexa Skills or Google Home Actions.
 
#### Knowledge ####
This allows us to take an existing knowledge base and enable it to be consumed by developers as endpoints.
 
An example of this was highlighted during a recent trip to the Microsoft Technology Center. They have a function which allows an internal documentation site to be searched and indexed, and then allows you to interact with it via question and answer interactions. Once created, this could then be used to provide a Q&A chatbot for an organization. For example, you could chat with a HR chatbot and ask it when benefit forms are due and get a response rather than trying to search a HR website. This provides users quick access to information. More information on QnA Maker is available at [https://azure.microsoft.com/en-us/services/cognitive-services/qna-maker/](https://azure.microsoft.com/en-us/services/cognitive-services/qna-maker/).
 
#### Language ####
Language AI platforms enable developers to better understand natural human language. Think of typing a normal question into a search engine and having it parse the sentence to derive an answer. Language AI platforms also enable us to do sentiment analysis on documents, as well as translation services between various spoken languages (ex. English text to Spanish).
 
An example of this could be using AI to translate the content of a website for users in real-time to another language. This isn’t new, but the translation capabilities have used AI internally to become MUCH better tools.
 
You can use language-based AI to ascertain the sentiment of content people are producing. If you are in customer service, you can have an application that’s reading tweets about your organization, identifies an unhappy post, and notifies your team to respond appropriately. Tools like this exist in the marketplace today, but we can develop custom solutions if we need to.
 
## Creating - Machine Learning ##
Another way to utilize AI is via Machine Learning. Machine Learning allows us to take lots of input data and make the data predictive. This is a more involved implementation than already created platform services from Microsoft and Google, but it allows us to provide solutions applicable to an organization's problem domain. There are many ways to solve these problems using machine learning by training models. We highlight four of them below with examples.
 
The most popular machine learning tool by far is [TensorFlow](https://www.tensorflow.org/), an open source tool created by Google. To use tools likes TensorFlow, the first step is to train a model, which is usually done with languages like Python and R. These models then can be consumed in an application locally on a device or by wrapping the output in an API Endpoint. Microsoft also has a machine learning platform called Microsoft Cognitive Toolkit (CNTK).
 
You will hear terms like [Jupyter Notebooks](https://jupyter.org/) and Azure Machine Learning workbench. These tools enable teams and organization to share learning from data and model creation.
 
### Types of Machine Learning ###
 
#### Supervised Learning ####
With supervised learning, you have input variables and output variables. You can think of this as an almost glorified math function. Given input data x, y and z (also called features) you get an output value of (y = f(x,y,z)) called a label. It is called supervised learning because we know the correct answer (the output value y or label), and we can “watch” the model as it is training itself until it gets to a proper error tolerance.
 
A real-world example of this is email spam. If you are Google, you get billions of emails a day, and you know which one users have identified as spam. You can then use the feature (the email) to identify which future emails are likely to be spam.
 
Another example would be the value of a house, based on a set of feature data called predictors. Predictors could be square feet, number of bedrooms, number of floors, etc. From these, you could develop a model to predict housing values based on historical data from a trained model.
 
A final example would be to take operating conditions of a machine and see if it is in a failure condition and turn it off.
 
#### Unsupervised Learning ####
With unsupervised learning, you have input variables (or features), but not corresponding output variables (or labels). In this case, we don’t know what the correct answer is. We are using this method to understand the structure of our data or the distribution of data. The unsupervised description comes from the fact that there is no correct answer and we cannot “watch” the model as it trains. Algorithms are left to find patterns in the data for us.
 
A real-world example of unsupervised learning could be buying habits. You can identify people coming to your site that buy product A, are also likely to buy product B, and recommend it to them. Common examples of this include suggested purchases in Amazon and suggested shows in Netflix and Hulu.
 
#### Semi-Supervised Learning ####
This training method is a combination of supervised and unsupervised learning. Some of your data is partially labeled and the remainder is not. This often tends to be found in the real world, where you do not have the luxury of having all of your data labeled.
 
An example of this is [Google Photos](https://photos.google.com/), it can identify person A is someone who appears in our photos a lot. You can then identify that person A is your significant other, and future photos are automatically tagged as person A.
 
#### Reinforcement Learning ####
This training method is quite different than the rest. In this case, you train the model to observe the environment, and then act. If the action is successful, the system gets a reward. As time goes on, it develops a strategy (called a policy) to maximize reward.
 
A recent example of this is [Google Deepmind’s Alpha Go](https://deepmind.com/research/alphago/). Google used supervised learning to [famously beat](https://www.theverge.com/2017/5/30/15712300/alphago-ai-humanity-google-artificial-intelligence-ke-jie) the world's best Go Player, Lee Se-dol, in May of 2016. Google then went back to the drawing board, and instead of using supervised learning to train the AI, it used reinforcement learning. The system was trained on the rules of Go, and it played against itself [many, many times](https://www.theverge.com/2017/10/18/16495548/deepmind-ai-go-alphago-zero-self-taught) to create a policy it used against opponents. The end result was a remarkably stronger program than the one that beat the world's best Go Player.
 
Google has a nice [video](https://www.youtube.com/watch?v=V1eYniJ0Rnk&vl=en) of this happening over time with a game of Breakout.
 
## Conclusion ##
Artificial Intelligence is an important emerging technology for enterprises. Taking advantage of existing AI platforms to infuse applications with smarts is a quick step to getting started. As organizations mature, machine learning can help organizations find value in the data they have to learn and predict.

 
## AI Vocabulary ##
* Attribute - a data type in a machine learning problem. For example, square footage.
* Feature - an attribute (data type) AND its value. For example, square footage = 1950.
* Classification - a subset of supervised learning problems where the output is a category. For example, spam or not spam for an email.
* Regression - a subset of supervised learning problems where the output is a value. For example, the estimated price of a house.
* Clustering - a subset of unsupervised learning problems where you want to discover groupings of the data. An example could be website visitor history that shows people are generally professional coders during the week, but hobby coders on the weekend.
*Association - a subset of unsupervised learning problems where you want to discover associations in the data. For example, Amazon knows that people who buy thing X (Captain America) are likely to buy thing Y (Black Panther).
* Policy - the strategy a machine learning system develops from a reinforcement learning program.
 
## Supervised Learning Algorithms ## 
* k-Nearest Neighbor
* Linear Regression - Regression problems
* Logistic Regression
* Support Vector Machines (SVMs) - Classification problems
* Decision Trees and Random Forest - Classification problems
* Neural Networks


This blog post originally appeared
at [Skyline Technologies](https://www.skylinetechnologies.com/Blog/Skyline-Blog/May_2018/artificial-intelligence-machine-learning-intro)