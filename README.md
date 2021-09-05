# Podlodka Pet Project Challenge

Мотивируем друг друга на завершение своих пет проджектов!

Каждую неделю каждый участник вносит в банк 1 ставку и ведет работу над своим проектом

Неделя считается засчитанной если как минимум 3 дня была активность в репозитории проекта

При достижении цели участник может забрать свои ставки + часть чужих ставок, если другие участники пропускали недели

## Current weekly bet

**1000р**

## Rules

- Коммиты три раза в неделю (можно смотреть по карте активности в github профиле), иначе неделя считается пропущенной
- Каждый участник за каждую неделю вносит в банк 1 ставку (по понедельникам)
- Если участник достиг цели, он забирает из банка деньги по формуле описаной в [скрипте](ChallengeWinCalculator.swift)
- Можно выйти из челенджа в любой момент, оплатив двойную ставку в банк
- Можно вернуться в челендж в любой момент, оплатив двойную ставку в банк

#### Commit requirements

- Минимум 1 символ (добавлен/удален/изменен)

## Calculating

#### Bets in, weeks completed

Частично автоматизировано

[GitHub Action](.github/workflows/calculateParticipantsWeeks.yml)

- Автоматически исполняется каждый понедельник в 8 утра при наличии активного раннера
- Выводит количество ставок сделанных каждым из участников
- Выводит количество засчитанных недель каждым из участников
- Опционально выводит все даты каждого участника

[Скрипт для подсчета](ChallengeActiveWeeksCalculator.swift)

Обязательные параметры:

`-author` - автор репозитория

`-repo` - название репозитория

`-since` - дата в формате `dd:mm:yy`

Дополнительные параметры:

`-show-dates` - для вывода всех дат по репозиторию в лог

#### Cash out

[Скрипт для подсчета](ChallengeWinCalculator.swift)

## Participants

#### Ernest0N

**Присоединился** 06.09.21

**Цель** Завершение всех фич описанных в github

[Проект](https://github.com/Ernest0-Production/RedmineClient)

---

#### VladimirBrejcha

**Присоединился** 06.09.21

**Цель** Релиз MVP в AppStore

[Проект](https://github.com/VladimirBrejcha/Rise)

---

#### LeshaAleshaaa

**Присоединился** 06.09.21

**Цель** Изучение SwiftUI

[Проект](https://github.com/LeshaAleshaaa/SwiftUIProject)

## Join us!

Хочешь присоединиться? Пиши в телеграм @VladimirBrejcha
