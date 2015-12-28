Benchmark results
============================
'stock' erlang is the version from ubuntu trusty.

Tunings:
- 'HA' is about enabling 'ha-policy: all'
- 'fhc' is about disabling fhc read cache
- 'hipe' is about enabling HiPE compilation
- 'stats' is about tuning stats collection in management plugin


Message size 5000
----------------------

erlang|rabbit|tuning|throughput
--------|--------|--------|--------
stock|3.5.6|HA|3476
stock|3.6.0|HA, fhc|3544
18.1|3.5.7|HA, fhc|3585
stock|3.5.4|HA, hipe, stats|3620
18.1|3.5.6|HA, fhc|3633
stock|3.5.7|HA, fhc|3662
stock|3.5.7|HA|3701
stock|3.5.4|HA, hipe|3703
stock|3.6.0|HA, fhc, stats|3723
stock|3.6.0|HA, fhc, hipe|3724
18.1|3.6.0|HA, fhc, stats|3740
stock|3.6.0|HA, stats|3744
18.1|3.5.4|HA, stats|3745
stock|3.5.7|HA, hipe|3753
stock|3.5.4|HA, stats|3773
18.1|3.5.7|HA, stats|3780
stock|3.5.6|HA, hipe|3782
18.1|3.5.7|HA|3788
stock|3.5.6|HA, fhc|3810
18.1|3.5.4|HA|3830
stock|3.5.7|HA, stats|3843
18.1|3.5.6|HA|3847
stock|3.5.4|HA|3853
18.1|3.5.6|HA, stats|3866
stock|3.6.0|HA, fhc, hipe, stats|3878
stock|3.5.6|HA, fhc, hipe, stats|3892
stock|3.5.6|HA, fhc, hipe|3903
stock|3.5.6|HA, fhc, stats|3904
stock|3.5.7|HA, fhc, hipe, stats|3922
18.1|3.6.0|HA, stats|3950
18.1|3.6.0|HA, fhc|3986
18.1|3.6.0|HA, fhc, hipe|3991
stock|3.6.0|HA, hipe, stats|4009
stock|3.5.7|HA, fhc, stats|4012
stock|3.5.7|HA, hipe, stats|4027
stock|3.6.0|HA|4051
18.1|3.5.6|HA, fhc, stats|4058
18.1|3.6.0|HA|4071
stock|3.6.0|HA, hipe|4087
18.1|3.5.4|HA, hipe|4095
18.1|3.5.7|HA, fhc, hipe|4115
stock|3.5.7|HA, fhc, hipe|4146
stock|3.5.6|HA, hipe, stats|4172
18.1|3.5.4|HA, hipe, stats|4185
18.1|3.6.0|HA, fhc, hipe, stats|4189
stock|3.5.6|HA, stats|4191
18.1|3.5.7|HA, fhc, stats|4205
18.1|3.5.7|HA, fhc, hipe, stats|4227
18.1|3.5.7|HA, hipe|4292
18.1|3.5.6|HA, hipe, stats|4299
18.1|3.5.7|HA, hipe, stats|4335
18.1|3.5.6|HA, hipe|4340
18.1|3.5.6|HA, fhc, hipe|4362
18.1|3.6.0|HA, hipe|4511
18.1|3.5.6|HA, fhc, hipe, stats|4631
18.1|3.6.0|HA, hipe, stats|4672
stock|3.5.4||7528
stock|3.5.7||7633
stock|3.6.0|fhc|7647
stock|3.5.6||7656
18.1|3.5.7||7759
stock|3.5.7|fhc|7777
stock|3.6.0|hipe, stats|7777
stock|3.5.6|hipe|7801
stock|3.6.0||7906
18.1|3.5.7|fhc|7913
18.1|3.5.4||7933
stock|3.5.7|fhc, hipe|7933
stock|3.5.7|fhc, hipe, stats|7935
stock|3.5.7|hipe, stats|7974
18.1|3.5.6|fhc|8017
18.1|3.5.6|stats|8018
stock|3.5.4|hipe|8035
stock|3.6.0|stats|8055
18.1|3.6.0||8080
18.1|3.5.4|stats|8090
18.1|3.6.0|fhc, stats|8099
18.1|3.5.6||8111
18.1|3.6.0|fhc|8137
stock|3.5.6|fhc|8188
stock|3.5.6|fhc, hipe|8257
stock|3.5.7|hipe|8262
stock|3.5.6|fhc, stats|8272
stock|3.5.4|hipe, stats|8362
stock|3.6.0|hipe|8387
stock|3.5.6|stats|8463
18.1|3.5.6|fhc, stats|8501
stock|3.6.0|fhc, hipe|8513
18.1|3.5.7|stats|8522
stock|3.5.4|stats|8546
stock|3.6.0|fhc, stats|8599
stock|3.5.7|stats|8649
stock|3.5.6|hipe, stats|8654
18.1|3.5.7|fhc, stats|8783
18.1|3.6.0|stats|8791
stock|3.5.7|fhc, stats|8962
stock|3.5.6|fhc, hipe, stats|8965
stock|3.6.0|fhc, hipe, stats|9209
18.1|3.5.7|hipe, stats|9588
18.1|3.5.6|fhc, hipe|9634
18.1|3.5.4|hipe|9766
18.1|3.5.7|fhc, hipe|9801
18.1|3.5.4|hipe, stats|9846
18.1|3.6.0|fhc, hipe|10045
18.1|3.6.0|fhc, hipe, stats|10142
18.1|3.6.0|hipe, stats|10145
18.1|3.5.6|hipe|10367
18.1|3.5.7|fhc, hipe, stats|10392
18.1|3.6.0|hipe|10500
18.1|3.5.7|hipe|10558
18.1|3.5.6|fhc, hipe, stats|10640
18.1|3.5.6|hipe, stats|10759


Message size 25000
----------------------

erlang|rabbit|tuning|throughput
--------|--------|--------|--------
stock|3.5.4|HA, hipe|2486
stock|3.5.7|HA, fhc|2597
stock|3.6.0|HA, hipe, stats|2640
stock|3.6.0|HA, stats|2642
stock|3.6.0|HA, fhc, hipe, stats|2662
stock|3.5.6|HA, fhc|2672
stock|3.5.4|HA, hipe, stats|2701
18.1|3.5.4|HA, hipe|2705
stock|3.5.4|HA|2721
stock|3.5.7|HA, fhc, hipe, stats|2722
18.1|3.5.7|HA, fhc, hipe, stats|2731
stock|3.5.6|HA, hipe|2732
18.1|3.5.7|HA|2739
18.1|3.5.4|HA|2741
18.1|3.6.0|HA|2746
stock|3.5.7|HA|2825
18.1|3.6.0|HA, fhc, stats|2826
stock|3.6.0|HA, fhc|2827
18.1|3.5.7|HA, fhc|2829
stock|3.5.6|HA, fhc, hipe|2830
18.1|3.5.6|HA, stats|2839
stock|3.5.7|HA, hipe, stats|2854
stock|3.6.0|HA|2869
18.1|3.5.6|HA|2873
18.1|3.6.0|HA, fhc, hipe|2876
18.1|3.5.6|HA, fhc|2877
18.1|3.5.4|HA, stats|2881
stock|3.5.6|HA, fhc, stats|2905
18.1|3.6.0|HA, hipe|2909
stock|3.6.0|HA, hipe|2922
stock|3.6.0|HA, fhc, stats|2922
18.1|3.6.0|HA, fhc|2927
stock|3.6.0|HA, fhc, hipe|2932
stock|3.5.6|HA|2947
18.1|3.6.0|HA, stats|2951
stock|3.5.6|HA, hipe, stats|2953
stock|3.5.7|HA, fhc, hipe|2954
stock|3.5.6|HA, fhc, hipe, stats|2956
stock|3.5.7|HA, hipe|2959
stock|3.5.7|HA, stats|2967
18.1|3.5.4|HA, hipe, stats|2973
18.1|3.5.6|HA, fhc, stats|2974
stock|3.5.6|HA, stats|2980
18.1|3.5.7|HA, fhc, hipe|2997
18.1|3.5.7|HA, hipe, stats|2999
18.1|3.5.7|HA, stats|3017
18.1|3.5.6|HA, hipe, stats|3017
stock|3.5.7|HA, fhc, stats|3021
18.1|3.5.7|HA, fhc, stats|3025
stock|3.5.4|HA, stats|3059
18.1|3.5.6|HA, fhc, hipe|3064
18.1|3.5.7|HA, hipe|3072
18.1|3.5.6|HA, hipe|3089
18.1|3.5.6|HA, fhc, hipe, stats|3129
18.1|3.6.0|HA, fhc, hipe, stats|3160
18.1|3.6.0|HA, hipe, stats|3213
stock|3.5.4|hipe|5886
stock|3.5.4||5973
stock|3.5.6||5982
stock|3.6.0|fhc, hipe|6012
18.1|3.6.0||6117
stock|3.5.6|hipe|6202
stock|3.6.0|hipe, stats|6304
stock|3.5.7|hipe, stats|6304
stock|3.5.7|fhc, hipe, stats|6305
stock|3.6.0|stats|6330
stock|3.5.7|fhc|6332
18.1|3.5.6|fhc|6366
18.1|3.5.4|stats|6444
18.1|3.6.0|fhc, stats|6460
stock|3.5.7|fhc, hipe|6477
18.1|3.5.4||6485
stock|3.6.0|hipe|6495
18.1|3.5.7||6495
18.1|3.5.7|fhc|6570
18.1|3.6.0|fhc|6593
18.1|3.5.6||6596
18.1|3.6.0|stats|6663
18.1|3.5.6|stats|6706
18.1|3.5.6|fhc, stats|6749
stock|3.5.6|fhc|6753
18.1|3.5.7|stats|6785
stock|3.5.6|stats|6790
stock|3.5.6|fhc, stats|6794
stock|3.5.4|hipe, stats|6898
stock|3.5.6|fhc, hipe|6918
18.1|3.5.7|fhc, hipe|6937
18.1|3.5.7|fhc, stats|6949
stock|3.6.0|fhc|6957
stock|3.6.0|fhc, hipe, stats|6973
18.1|3.5.7|hipe, stats|7012
stock|3.5.6|fhc, hipe, stats|7023
stock|3.6.0|fhc, stats|7032
stock|3.5.7||7033
18.1|3.5.4|hipe|7036
stock|3.5.4|stats|7046
stock|3.5.7|hipe|7046
stock|3.6.0||7059
stock|3.5.7|stats|7077
18.1|3.5.4|hipe, stats|7155
18.1|3.5.6|fhc, hipe|7217
stock|3.5.6|hipe, stats|7252
18.1|3.5.7|fhc, hipe, stats|7380
18.1|3.6.0|fhc, hipe, stats|7397
18.1|3.6.0|fhc, hipe|7397
stock|3.5.7|fhc, stats|7622
18.1|3.5.6|hipe|7648
18.1|3.6.0|hipe|7711
18.1|3.5.7|hipe|7786
18.1|3.5.6|fhc, hipe, stats|7804
18.1|3.6.0|hipe, stats|7881
18.1|3.5.6|hipe, stats|7910


Message size 50000
----------------------

erlang|rabbit|tuning|throughput
--------|--------|--------|--------
stock|3.5.4|HA, hipe, stats|1644
18.1|3.5.7|HA, fhc, hipe, stats|1725
stock|3.6.0|HA, stats|1789
stock|3.5.6|HA|1793
18.1|3.5.4|HA, hipe|1820
stock|3.5.7|HA, fhc, hipe, stats|1849
stock|3.5.4|HA|1877
stock|3.5.6|HA, hipe|1883
18.1|3.5.7|HA|1901
stock|3.5.7|HA, fhc|1907
stock|3.5.6|HA, fhc|1925
stock|3.5.4|HA, hipe|1946
18.1|3.6.0|HA|1948
stock|3.5.7|HA, hipe, stats|1977
stock|3.6.0|HA, fhc|1991
18.1|3.5.4|HA|1995
stock|3.6.0|HA, fhc, hipe, stats|2003
18.1|3.5.6|HA, fhc|2009
18.1|3.6.0|HA, hipe|2028
18.1|3.5.6|HA, stats|2031
stock|3.5.7|HA|2033
18.1|3.5.7|HA, fhc|2046
18.1|3.6.0|HA, fhc, stats|2074
18.1|3.5.6|HA, fhc, stats|2075
18.1|3.5.7|HA, hipe, stats|2086
18.1|3.5.4|HA, stats|2088
18.1|3.6.0|HA, fhc, hipe|2089
stock|3.5.6|HA, fhc, hipe|2093
stock|3.6.0|HA|2098
18.1|3.5.6|HA|2102
18.1|3.5.7|HA, fhc, hipe|2111
18.1|3.6.0|HA, fhc|2122
stock|3.6.0|HA, fhc, stats|2122
stock|3.5.7|HA, fhc, hipe|2131
18.1|3.6.0|HA, fhc, hipe, stats|2132
18.1|3.5.4|HA, hipe, stats|2135
stock|3.5.6|HA, fhc, stats|2136
18.1|3.5.6|HA, hipe|2160
stock|3.5.7|HA, stats|2161
stock|3.5.6|HA, hipe, stats|2169
18.1|3.6.0|HA, stats|2172
stock|3.5.6|HA, fhc, hipe, stats|2188
stock|3.5.6|HA, stats|2191
stock|3.6.0|HA, fhc, hipe|2195
stock|3.5.7|HA, fhc, stats|2197
stock|3.5.7|HA, hipe|2197
18.1|3.5.6|HA, fhc, hipe, stats|2197
18.1|3.5.7|HA, stats|2210
18.1|3.5.6|HA, fhc, hipe|2218
18.1|3.5.6|HA, hipe, stats|2233
stock|3.6.0|HA, hipe|2243
18.1|3.5.7|HA, fhc, stats|2264
18.1|3.5.7|HA, hipe|2273
stock|3.5.4|HA, stats|2294
18.1|3.6.0|HA, hipe, stats|2303
stock|3.6.0|HA, hipe, stats|2334
stock|3.5.4|hipe|4379
stock|3.5.7|fhc, hipe, stats|4619
stock|3.5.4||4667
18.1|3.6.0||4720
stock|3.6.0|stats|4784
stock|3.6.0|hipe, stats|4805
stock|3.5.6|hipe|4806
stock|3.5.6||4846
18.1|3.5.4|stats|4898
stock|3.5.7|fhc|4909
18.1|3.6.0|fhc, stats|4921
stock|3.5.7|hipe, stats|4960
18.1|3.5.7|fhc, hipe|4966
18.1|3.5.7||4966
18.1|3.5.4|hipe|4974
18.1|3.5.6|fhc|4982
stock|3.5.4|hipe, stats|4992
18.1|3.5.6|stats|5011
18.1|3.5.4||5018
stock|3.6.0||5059
stock|3.5.7|fhc, hipe|5087
stock|3.6.0|hipe|5129
18.1|3.6.0|fhc, hipe|5142
stock|3.6.0|fhc, hipe, stats|5166
18.1|3.5.7|fhc, hipe, stats|5177
stock|3.5.6|fhc|5195
18.1|3.5.4|hipe, stats|5199
stock|3.5.7|hipe|5205
18.1|3.5.7|hipe, stats|5213
18.1|3.5.7|fhc|5215
stock|3.6.0|fhc|5218
stock|3.6.0|fhc, hipe|5262
stock|3.5.6|fhc, stats|5271
18.1|3.5.6||5275
stock|3.5.6|fhc, hipe|5279
18.1|3.6.0|stats|5297
stock|3.6.0|fhc, stats|5308
18.1|3.5.7|fhc, stats|5323
18.1|3.5.7|stats|5341
18.1|3.5.6|fhc, hipe|5358
18.1|3.5.6|fhc, stats|5390
18.1|3.6.0|fhc, hipe, stats|5392
stock|3.5.6|stats|5435
18.1|3.6.0|fhc|5441
stock|3.5.7|fhc, stats|5507
stock|3.5.7|stats|5521
stock|3.5.6|hipe, stats|5549
18.1|3.5.6|hipe|5558
18.1|3.6.0|hipe|5565
stock|3.5.6|fhc, hipe, stats|5586
18.1|3.6.0|hipe, stats|5618
18.1|3.5.7|hipe|5628
stock|3.5.4|stats|5658
stock|3.5.7||5750
18.1|3.5.6|fhc, hipe, stats|5753
18.1|3.5.6|hipe, stats|5775
