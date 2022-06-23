---
aliases: Job Sequencing Problem
tags: 学习/计算机
author: tusrau
date created: '{{date:YYYYMMDD HH:mm}}'
date updated: 20220504 03:44
---

# Task Scheduling

# Job Sequencing Problem

>https://www.youtube.com/watch?v=R6Skj4bT1HE
>https://www.geeksforgeeks.org/job-sequencing-problem/

1. 按照惩罚/奖励来降序排列
2. 从头开始捋，如果在deadline之前有空，则放在距离deadline最近的格子里（比如A放在1-2的格子里），如果没有空，则skip
3. 捋到最后

The **Time Complexity** of the above solution is O(n^2)

![[Pasted image 20220504034150.png]]

![[Pasted image 20220504034408.png]]

``void` `printJobScheduling(ArrayList<Job> arr,` `int` `t)`

    `{`

        `// Length of array`

        `int` `n = arr.size();`

        `// Sort all jobs according to decreasing order of`

        `// profit`

        `Collections.sort(arr,(a, b) -> b.profit - a.profit);`

        `// To keep track of free time slots`

        `boolean` `result[] =` `new` `boolean``[t];`

        `// To store result (Sequence of jobs)`

        `char` `job[] =` `new` `char``[t];`

        `// Iterate through all given jobs`

        `for` `(``int` `i =` `0``; i < n; i++) {`

            `// Find a free slot for this job (Note that we`

            `// start from the last possible slot)`

            `for` `(``int` `j = Math.min(t -` `1``, arr.get(i).deadline -` `1``); j >=` `0``; j--) {`

                `// Free slot found`

                `if` `(result[j] ==` `false``) {`

                    `result[j] =` `true``;`

                    `job[j] = arr.get(i).id;`

                    `break``;`

                `}`

            `}`

        `}`

        `// Print the sequence`

        `for` `(``char` `jb : job)`

            `System.out.print(jb +` `" "``);`

        `System.out.println();`

    `}`
