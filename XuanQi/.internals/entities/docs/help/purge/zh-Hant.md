# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
# Copyright 2023 "Holloway" Chew, Kean Ho <kean.ho.chew@zoralab.com>
# Copyright 2023 ZORALab Enterprise <tech@zoralab.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho's Liberal License (the 'License').
# You must comply with the license to use the content. Get the License at:
#
# https://doi.org/10.5281/zenodo.13770769
#
# You MUST ensure any interaction with the content STRICTLY COMPLIES with
# the permissions and limitations set forth in the license.
#
# NOTE: The license notice and this comment will not be rendered. New line
#       begins with the first non-empty line below.




# Purge CLI

`Purge`命令列介面（CLI）用於完全清理專案工作區。

預設情況下，它會刪除以下路徑：

```
$XUANQI_PATH_LOGS       # 所有之前的建置日誌
$XUANQI_PATH_PUBLIC     # 所有輸出
$XUANQI_PATH_TEMPS      # 之前建置的所有暫存檔
```

與靜默清除不同的是此CLI在實際刪除前檢查目標存在性。否則，
此CLI不會執行任何操作。




## 刪除通知

XuanQi會在實際刪除目標前先將僅報告。




## 結語

這就是此CLI的全部內容。
