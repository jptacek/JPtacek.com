---
layout: post
title: Have Your Pi and Eat it Too: A Comparison of C# and C++ Performance
date: 2013-03-15
tags: ["Ephemera","Pi","Skyline Technologies"]
---

In honor of [National Pi Day](http://en.wikipedia.org/wiki/Pi_Day), we thought it would be fun to calculate Pi and talk about performance differences between C# and C++. There is some math coming your way (yeah Math!), but feel free to skip to the end for a discussion on performance.

So back in the day, when things where WAY different, Pi was calculated using a mathematical series. One of the more famous ones uses the arctan math function to calculate the value of π. This is called the Leibniz formula for π and is represented by

	[![pi1](http://www.jptacek.com/wp-content/uploads/2013/03/pi1.jpg)](pi1.jpg)

Now, this is one of the more inefficient ways to calculate π, it takes about 10 million terms to get an accuracy of 7 decimal places. For those of us asking performance differences between languages though, that is great! 

We have written two programs to calculate π, one in C# and one in C++. They are both syntactically similar and use the same algorithm. We tried to get as close to an apples comparison as we could, but in comparing two different languages, we did our best, you are still comparing an apple to an orange.

So, what did we see? We calculated π to 15 decimal points, 3.141592653589793 for those of you keeping track at home. Both programs took almost 100 million iterations to converge, 99,995,330 to be exact. We ran each of the programs 10 times to get an average as shown in the following table

<div style="text-align: center"><table style="border-collapse:collapse" border="0"><colgroup><col style="width:102px"/><col style="width:102px"/><col style="width:66px"/></colgroup><tbody valign="top"><tr style="height: 20px"><td style="padding-left: 7px; padding-right: 7px; border-top:  solid 0.5pt; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">**Run**</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  solid 0.5pt; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">**C++**</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  solid 0.5pt; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">**C#**</span>
</td></tr><tr style="height: 20px"><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">1</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4.384</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6.908</span>
</td></tr><tr style="height: 20px"><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">2</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4.299</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6.466</span>
</td></tr><tr style="height: 20px"><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">3</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4.3375</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6.805</span>
</td></tr><tr style="height: 20px"><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4.18</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6.584</span>
</td></tr><tr style="height: 20px"><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">5</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4.523</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6.516</span>
</td></tr><tr style="height: 20px"><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4.186</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6.518</span>
</td></tr><tr style="height: 20px"><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">7</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4.164</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6.492</span>
</td></tr><tr style="height: 20px"><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">8</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4.175</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6.351</span>
</td></tr><tr style="height: 20px"><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">9</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4.274</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6.56</span>
</td></tr><tr style="height: 20px"><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">10</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4.342</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6.589</span>
</td></tr><tr><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid 0.5pt; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:#444444; font-family:Segoe UI; font-size:9pt">Average</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">4.29</span>
</td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid 0.5pt; border-right:  solid 0.5pt">

<span style="color:black; font-size:9pt">6.58</span>
</td></tr></tbody></table></div>

The calculation of π using C++ is 35% faster that it's corresponding C# code. This is to be expected. Many modern languages such as C# and Java run through a managed runtime. This brings MANY efficiencies to developers. However, the runtime tends to add overhead when it comes to performance. 

The pragmatic folks reading this realize, that the benefits of a managed execution environment and modern language generally outweigh performance gains from a language like C++. There are reasons that C# and Java are used instead of C++ because developers can be more productive. Our example here, using a very slow numerical algorithm and running it for ten million iterations is a stretch for most scenarios. The 2.5 second difference for such an intensive calculation, while relatively large in our example, in the grand scheme of things is not that big of difference.

So why bring it up? It is important to think through performance more and more in today's computing environment for two reasons. The first is cost. As more and more organization move to utility based computing with hosted services, such as Amazon Web Services (AWS) and Azure, organization are paying for their compute cost. If you can realize performance gains that reduce CPU cycles that has a direct impact on the bottom line. The second reason is that mobile is taking over the world, and mobile users want more battery life, not less. Fewer CPU cycles on a smartphone or tablet will result in better battery life. 

It will be very rare that most organizations would use C++ or other "closer to the metal" languages for their Line of Business (LOB) applications. The moral of the story though is for intensive processes in cloud hosted or mobile environments, you want to be razor focused on optimizing your code for performance, no matter what language you choose.

Both code examples are included, so for National Pi day, make a circle, calculate some π, eat some pie and enjoy!

C++

<pre class="brush: cpp">
// LifeOfPi.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <iomanip>
using namespace std;

void pi( double *pi_value, int *iterations);  

int main ( void )  
{  

      int iterations = 0;     // number of actual loop iterations in pi 
      double pi_value = 0;    // computed value of pi 

      clock_t cBegin = (double)clock () ; 
      pi(&pi_value, &iterations);  
      printf("   %0.15f with %d iterations\n",  pi_value, iterations);  
      clock_t cEnd = (double) clock() ; 

      std::cout << float( cEnd - cBegin ) 

return 0;  

}    

void pi( double *pi_value, int *iterations)  
{  
      int i;  
      int k=1;
      double realPi = 3.141592653589793; 
      double epsilon = 0.00000001;
      double delta=10;
      *pi_value= 0;
      while (delta>epsilon) {
            *pi_value += pow(-1,(k+1))/(2*k-1);
            delta = fabs((4* *pi_value)-realPi);
            k++;
      }
      *iterations = k;
      *pi_value = 4 * *pi_value;

      return; // indicate program ended sucessfully 

} // end fucntion main 
</pre>

</span>

C#

<pre class="brush: csharp">
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LifeOfPiCSharp
{
    class Program
    {
        static void Main(string[] args)
        {
            int iterations = 0;
            double pi_value = 0;

            DateTime startTime = DateTime.Now;
            pi(out pi_value,out iterations);
            DateTime endTime = DateTime.Now;
            Console.WriteLine(pi_value.ToString() + " in " + iterations);
            TimeSpan diff = endTime.Subtract(startTime);
            Console.WriteLine(diff.Seconds + "."+diff.Milliseconds);
        }

        public static void pi(out double pi_value, out int totalIterations)
        {
            double realPi = 3.141592653589793;
            double epsilon = 0.00000001;
            double delta = 10;
            int k = 1;

            pi_value = 0;
            while (delta > epsilon)
            {
                pi_value += Math.Pow(-1, (k + 1)) / (2 * k - 1);
                delta = Math.Abs((4 * pi_value) - realPi);
                k++;
            }
            totalIterations = k;
            pi_value = 4 * pi_value;

        }
    }
} 
</pre>

&nbsp;

This blog post originally appeared at [Skyline Technologies](http://www.skylinetechnologies.com/Blog/Lists/Posts/Post.aspx?ID=186)