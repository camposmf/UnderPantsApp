using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UnderPantsApp.Migrations
{
    /// <inheritdoc />
    public partial class ExpenseNewColumns_2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Name",
                table: "Expenses",
                type: "TEXT",
                maxLength: 255,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "PeriodicityNumber",
                table: "Expenses",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Name",
                table: "Expenses");

            migrationBuilder.DropColumn(
                name: "PeriodicityNumber",
                table: "Expenses");
        }
    }
}
