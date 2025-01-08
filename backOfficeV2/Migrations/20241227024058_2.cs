using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace backOfficeV2.Migrations
{
    public partial class _2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AmountSold",
                table: "Product");

            migrationBuilder.AddColumn<int>(
                name: "AmountPay",
                table: "Bill",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AmountPay",
                table: "Bill");

            migrationBuilder.AddColumn<int>(
                name: "AmountSold",
                table: "Product",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
