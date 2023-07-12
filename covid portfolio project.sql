#Covid 19 Data Exploration
#Skills used: Joins, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types 

select * from coviddeaths;

Select Location, date, total_cases, new_cases, total_deaths, population
From CovidDeaths
Where continent is not null 
order by 1,2;
#Looking at Total Cases vs Total Deaths
Select Location, date, total_cases,total_deaths,round((total_deaths/total_cases)*100,2) as DeathPercentage
From CovidDeaths
order by 1,2;
#Total Cases vs Population
#Shows what percentage of population infected with Covid
Select Location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From CovidDeaths
#Where location like '%states%'
order by 1,2;
#Countries with Highest Infection Rate compared to Population
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc;
-- Countries with Highest Death Count per Population
Select Location, MAX(Total_deaths) as TotalDeathCount
From CovidDeaths
Group by Location
order by TotalDeathCount desc;
-- Showing contintents with the highest death count per population
Select continent, MAX((Total_deaths )) as TotalDeathCount
From CovidDeaths
Where continent is not null 
Group by continent
order by TotalDeathCount desc;
-- Total Population vs Vaccinations
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3;

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 

