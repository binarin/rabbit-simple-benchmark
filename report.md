Benchmark results
============================
'stock' erlang is the version from ubuntu trusty.

Tunings:
- 'fhc' is about disabling fhc read cache
- 'hipe' is about enabling HiPE compilation
- 'stats' is about tuning stats collection in management plugin
Message size 5000
----------------------
erlang|rabbit|tuning|throughput
--------|--------|--------|--------
stock|3.5.6|fhc|3500
18.1|3.5.4||3545
18.1|3.5.6|fhc|3653
stock|3.5.6|hipe|3685
stock|3.5.6||3702
stock|3.6.0-rc1|fhc, stats|3713
18.1|3.6.0-rc1||3715
stock|3.5.4||3728
18.1|3.5.6||3732
stock|3.5.6|fhc, hipe|3740
18.1|3.6.0-rc1|fhc|3774
18.1|3.5.4|stats|3789
stock|3.5.6|fhc, stats|3802
stock|3.6.0-rc1||3843
stock|3.5.6|stats|3848
18.1|3.6.0-rc1|fhc, stats|3857
18.1|3.6.0-rc1|stats|3868
stock|3.5.6|hipe, stats|3928
18.1|3.5.6|stats|3935
18.1|3.5.6|fhc, stats|3981
stock|3.5.6|fhc, hipe, stats|4038
stock|3.6.0-rc1|fhc|4056
stock|3.5.4|hipe|4097
stock|3.5.4|stats|4140
stock|3.6.0-rc1|stats|4301
18.1|3.5.4|hipe, stats|4314
stock|3.5.4|hipe, stats|4317
18.1|3.5.4|hipe|4451
18.1|3.5.6|hipe|4464
18.1|3.5.6|fhc, hipe|4467
18.1|3.5.6|fhc, hipe, stats|4524
18.1|3.5.6|hipe, stats|4719
18.1|3.5.4||7813
stock|3.6.0-rc1||7950
stock|3.5.6||8008
stock|3.5.4|hipe|8035
18.1|3.6.0-rc1|fhc|8043
stock|3.5.4||8046
stock|3.5.6|fhc, stats|8110
18.1|3.5.6|fhc|8117
18.1|3.6.0-rc1||8196
18.1|3.5.6|fhc, stats|8268
18.1|3.5.4|stats|8274
stock|3.5.6|fhc, hipe|8281
18.1|3.6.0-rc1|fhc, stats|8335
stock|3.5.6|fhc, hipe, stats|8365
stock|3.5.4|stats|8369
stock|3.5.6|stats|8373
stock|3.6.0-rc1|fhc|8415
18.1|3.5.6||8466
stock|3.5.6|fhc|8488
stock|3.5.4|hipe, stats|8504
18.1|3.6.0-rc1|stats|8664
stock|3.5.6|hipe, stats|8664
18.1|3.5.6|stats|8694
stock|3.5.6|hipe|8704
stock|3.6.0-rc1|fhc, stats|8762
stock|3.6.0-rc1|stats|8874
18.1|3.5.6|fhc, hipe|10081
18.1|3.5.4|hipe|10293
18.1|3.5.4|hipe, stats|10370
18.1|3.5.6|hipe, stats|10724
18.1|3.5.6|hipe|10942
18.1|3.5.6|fhc, hipe, stats|11167
Message size 25000
----------------------
erlang|rabbit|tuning|throughput
--------|--------|--------|--------
stock|3.5.4||2591
stock|3.5.6|fhc, stats|2634
stock|3.5.4|hipe|2694
stock|3.5.6|hipe, stats|2735
18.1|3.5.4||2759
18.1|3.5.4|stats|2771
stock|3.6.0-rc1|fhc|2826
18.1|3.6.0-rc1|fhc|2831
18.1|3.5.6|fhc, stats|2831
18.1|3.6.0-rc1||2836
18.1|3.6.0-rc1|stats|2839
stock|3.5.4|stats|2864
stock|3.5.4|hipe, stats|2866
18.1|3.5.6||2871
18.1|3.5.6|fhc|2878
18.1|3.6.0-rc1|fhc, stats|2879
stock|3.5.6|hipe|2885
stock|3.5.6|fhc|2955
stock|3.5.6|fhc, hipe|2956
stock|3.5.6|fhc, hipe, stats|2957
18.1|3.5.6|stats|2976
stock|3.6.0-rc1||2976
stock|3.5.6||2990
stock|3.6.0-rc1|fhc, stats|3006
stock|3.5.6|stats|3029
18.1|3.5.6|fhc, hipe|3033
stock|3.6.0-rc1|stats|3051
18.1|3.5.4|hipe, stats|3061
18.1|3.5.6|hipe|3156
18.1|3.5.4|hipe|3166
18.1|3.5.6|fhc, hipe, stats|3203
18.1|3.5.6|hipe, stats|3248
18.1|3.6.0-rc1|fhc|6197
stock|3.5.4||6265
stock|3.6.0-rc1||6335
stock|3.5.4|hipe|6423
stock|3.5.6|fhc, stats|6425
18.1|3.5.6|fhc, stats|6488
18.1|3.5.4|stats|6490
18.1|3.5.4||6495
18.1|3.6.0-rc1|fhc, stats|6543
18.1|3.6.0-rc1||6547
stock|3.6.0-rc1|fhc|6563
stock|3.5.4|stats|6593
stock|3.5.6|fhc|6593
18.1|3.5.6||6660
stock|3.5.6|fhc, hipe|6693
18.1|3.6.0-rc1|stats|6708
18.1|3.5.6|fhc|6821
stock|3.5.6|stats|6836
stock|3.5.6||6872
stock|3.5.6|hipe|6920
stock|3.6.0-rc1|fhc, stats|6920
stock|3.5.6|fhc, hipe, stats|7012
18.1|3.5.6|stats|7036
stock|3.5.6|hipe, stats|7055
stock|3.6.0-rc1|stats|7133
18.1|3.5.6|fhc, hipe|7349
stock|3.5.4|hipe, stats|7398
18.1|3.5.4|hipe, stats|7675
18.1|3.5.4|hipe|7690
18.1|3.5.6|hipe, stats|8085
18.1|3.5.6|fhc, hipe, stats|8245
18.1|3.5.6|hipe|8279
Message size 50000
----------------------
erlang|rabbit|tuning|throughput
--------|--------|--------|--------
stock|3.5.4||1735
stock|3.5.6|fhc, stats|1887
stock|3.5.4|hipe, stats|1931
stock|3.5.4|hipe|1953
18.1|3.5.4||1976
stock|3.6.0-rc1|fhc|1980
18.1|3.6.0-rc1|fhc|2050
18.1|3.5.6||2052
18.1|3.6.0-rc1|stats|2056
18.1|3.5.6|fhc, stats|2081
18.1|3.6.0-rc1|fhc, stats|2088
stock|3.5.6||2090
stock|3.5.6|hipe|2094
18.1|3.5.6|fhc|2094
18.1|3.6.0-rc1||2102
18.1|3.5.4|stats|2107
stock|3.5.6|fhc, hipe, stats|2117
stock|3.5.4|stats|2122
18.1|3.5.4|hipe, stats|2125
stock|3.6.0-rc1|fhc, stats|2148
stock|3.5.6|hipe, stats|2154
stock|3.5.6|fhc, hipe|2155
18.1|3.5.6|hipe|2164
18.1|3.5.6|stats|2166
18.1|3.5.4|hipe|2170
18.1|3.5.6|fhc, hipe, stats|2184
18.1|3.5.6|fhc, hipe|2197
stock|3.6.0-rc1|stats|2218
stock|3.5.6|fhc|2220
18.1|3.5.6|hipe, stats|2268
stock|3.5.6|stats|2270
stock|3.6.0-rc1||2277
stock|3.5.4||4660
stock|3.5.4|hipe|4833
stock|3.5.6|fhc, stats|4872
stock|3.6.0-rc1||4881
18.1|3.6.0-rc1|fhc|4898
18.1|3.6.0-rc1|fhc, stats|4913
stock|3.5.4|stats|4959
18.1|3.5.6|fhc, stats|4977
18.1|3.5.4||5043
18.1|3.5.6||5068
18.1|3.5.4|stats|5088
18.1|3.6.0-rc1||5107
18.1|3.6.0-rc1|stats|5144
stock|3.5.6|fhc|5202
18.1|3.5.6|fhc|5233
18.1|3.5.6|stats|5306
stock|3.6.0-rc1|fhc|5313
18.1|3.5.4|hipe, stats|5384
18.1|3.5.6|fhc, hipe|5394
stock|3.5.6|stats|5486
stock|3.5.6|fhc, hipe|5513
stock|3.5.6|hipe, stats|5539
stock|3.5.4|hipe, stats|5562
stock|3.5.6||5576
stock|3.5.6|fhc, hipe, stats|5577
stock|3.5.6|hipe|5596
stock|3.6.0-rc1|stats|5626
stock|3.6.0-rc1|fhc, stats|5706
18.1|3.5.4|hipe|5825
18.1|3.5.6|fhc, hipe, stats|5902
18.1|3.5.6|hipe|5955
18.1|3.5.6|hipe, stats|6012
